import { Op } from "sequelize";
import Users from "../models/Usermodel.js";
import argon2 from "argon2";
import jwt from "jsonwebtoken";

/* ============================================
   GET ALL USERS (Tidak perlu token)
   ============================================ */
export const getAllUsers = async (req, res) => {
  try {
    const users = await Users.findAll({
      attributes: { exclude: ["password"] },
    });

    if (users.length === 0) {
      return res.status(404).json({ error: "Data tidak ditemukan!" });
    }

    res.status(200).json({
      message: "Data berhasil ditemukan!",
      users,
    });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

/* ============================================
   GET USER BY ID (Token dari middleware)
   ============================================ */
export const getUsersById = async (req, res) => {
  try {
    const { id } = req.params;

    // Data user hasil dari middleware verifyToken
    const decoded = req.user;

    // Batasi akses: user biasa hanya bisa lihat data miliknya sendiri
    if (decoded.role !== "admin" && decoded.id != id) {
      return res.status(403).json({ error: "Akses ditolak!" });
    }

    const users = await Users.findOne({
      where: { id },
      attributes: { exclude: ["password"] },
    });

    if (!users) {
      return res.status(404).json({ error: "Users tidak ditemukan!" });
    }

    res.status(200).json({
      message: "Users ditemukan!",
      users,
    });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

/* ============================================
   UPDATE USERS (Token dari middleware)
   ============================================ */
export const UpdateUsers = async (req, res) => {
  try {
    const decoded = req.user;
    const { username, email, password, profile } = req.body;

    const users = await Users.findOne({ where: { id: decoded.id } });
    if (!users) return res.status(404).json({ error: "Users tidak ditemukan!" });

    const hash = password ? await argon2.hash(password) : users.password;

    await Users.update(
      { username, email, password: hash, profile },
      { where: { id: decoded.id } }
    );

    res.status(200).json({ message: "Profil berhasil diubah!" });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

/* ============================================
   DELETE USERS (Token dari middleware)
   ============================================ */
export const DeleteUsers = async (req, res) => {
  try {
    const decoded = req.user;

    const users = await Users.findOne({ where: { id: decoded.id } });
    if (!users) return res.status(404).json({ error: "Users tidak ditemukan!" });

    await Users.destroy({ where: { id: decoded.id } });
    res.status(200).json({ message: "Users berhasil dihapus!" });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

/* ============================================
   REGISTER
   ============================================ */
export const Register = async (req, res) => {
  try {
    const { username, email, password, confPass } = req.body;

    const existingUser = await Users.findOne({
      where: { [Op.or]: [{ username }, { email }] },
    });

    const allUsers = await Users.findAll();
    const errors = [];

    if (existingUser) errors.push("Username atau email sudah digunakan!");
    if (password !== confPass) errors.push("Password dan konfirmasi tidak sama!");

    const role = allUsers.length > 0 ? "users" : "admin";
    if (errors.length > 0) return res.status(400).json({ error: errors });

    const hash = await argon2.hash(password);
    await Users.create({ username, email, password: hash, role });

    res.status(201).json({ message: "Berhasil register!" });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

/* ============================================
   LOGIN
   ============================================ */
export const Login = async (req, res) => {
  try {
    const { userOREmail, password } = req.body;
    const users = await Users.findOne({
      where: { [Op.or]: [{ username: userOREmail }, { email: userOREmail }] },
    });

    if (!users)
      return res.status(404).json({ error: "Username atau email tidak terdaftar!" });

    const match = await argon2.verify(users.password, password);
    if (!match) return res.status(403).json({ error: "Password salah!" });

    const token = jwt.sign(
      {
        id: users.id,
        username: users.username,
        email: users.email,
        role: users.role,
      },
      process.env.JWT_SECRET,
      { expiresIn: "1d" }
    );

    // Simpan token ke cookie HTTP-only
    res.cookie("token", token, {
      httpOnly: true,
      secure: false, // ubah true kalau HTTPS
      sameSite: "lax",
    });

    res.status(200).json({ message: "Login berhasil!" });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

/* ============================================
   ME (Optional — pakai header Authorization)
   ============================================ */
export const Me = async (req, res) => {
  try {
    const authHeader = req.headers["authorization"];
    const token = authHeader && authHeader.split(" ")[1];

    if (!token) {
      return res.status(401).json({ message: "Token tidak ditemukan!" });
    }

    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    res.status(200).json({
      message: `Selamat datang ${decoded.username}!`,
      user: decoded,
    });
  } catch (error) {
    res.status(403).json({
      message: "Token tidak valid atau sudah kadaluarsa!",
      error: error.message,
    });
  }
};

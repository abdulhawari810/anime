import { where } from "sequelize";
import { Schedule, Anime } from "./../models/relationship.js";

export const getSchedule = async (req, res) => {
  try {
    const schedule = await Schedule.findAll();

    if (schedule.length === 0)
      return res.status(404).json({ error: "jadwal Anime tidak ditemukan!" });

    res.status(200).json({
      message: "Jadwal Anime Ditemukan!!",
      jadwal: schedule,
    });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};
export const getScheduleByDay = async (req, res) => {};
export const createSchedule = async (req, res) => {
  try {
    const { id } = req.params;
    const { hari, waktu_rilis } = req.body;
    const anime = await Anime.findOne({
      where: {
        id: id,
      },
    });
    const existing = await Schedule.findOne({
      where: {
        anime_key: id,
      },
    });

    if (existing) {
      return res
        .status(403)
        .json({ error: "Jadwal untuk anime ber id " + id + " sudah ada!" });
    } else if (anime && anime.status === "Selesai Tayang")
      return res.status(403).json({ error: "Anime ini sudah Selesai Tayang" });

    await Schedule.create({
      hari: hari,
      waktu_rilis: waktu_rilis,
      anime_key: id,
    });

    res.status(201).json({ message: "Jadwal berhasil ditambahkan!" });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};
export const updateSchedule = async (req, res) => {};
export const deleteSchedule = async (req, res) => {};

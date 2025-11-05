import { Anime, Episode } from "../models/relationship.js";
import slugify from "slugify";

export const getAllAnime = async (req, res) => {
  try {
    const anime = await Anime.findAll();

    if (anime.length == 0) {
      return res.status(404).json({
        error: "Anime tidak ditemukan!",
      });
    }

    res.status(200).json({
      message: "Anime ditemukan!",
      anime: anime,
    });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};
export const getAnimeById = async (req, res) => {
  try {
    const { slug } = req.params;
    const anime = await Anime.findOne({
      where: {
        slug: slug,
      },
    });

    if (!anime)
      return res.status(404).json({ error: "Anime tidak ditemukan!" });

    res.status(200).json({
      message: "Anime berhasil ditemukan!",
      anime: anime,
    });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};
export const CreateAnime = async (req, res) => {
  try {
    const {
      judul,
      genre,
      total_eps,
      kualitas,
      status,
      adaptasi,
      negara,
      studio,
      tipe,
      musim,
      eksplisit,
      demografis,
      rating,
      deskripsi,
      skor,
      peminat,
      kredit,
      thumbnail,
      durasi,
    } = req.body;

    const slug = slugify(judul, {
      lower: true,
      strict: true,
      remove: /[*+~.()'"!:@]/g,
    });

    await Anime.create({
      slug: slug,
      judul: judul,
      genre: JSON.stringify(genre),
      total_eps: total_eps,
      kualitas: kualitas,
      status: status,
      adaptasi: adaptasi,
      negara: negara,
      studio: studio,
      tipe: tipe,
      musim: musim,
      eksplisit: eksplisit,
      demografis: demografis,
      rating: rating,
      deskripsi: deskripsi,
      skor: skor,
      peminat: peminat,
      kredit: kredit,
      thumbnail: thumbnail,
      durasi: durasi,
    });

    res.status(201).json({
      message: "Anime sukses ditambahkan!!",
    });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};
export const UpdateAnime = async (req, res) => {
  try {
    const {
      judul,
      genre,
      total_eps,
      kualitas,
      status,
      adaptasi,
      negara,
      studio,
      tipe,
      musim,
      eksplisit,
      demografis,
      rating,
      deskripsi,
      skor,
      peminat,
      kredit,
      thumbnail,
      durasi,
    } = req.body;

    const { id } = req.params;
    const slug = slugify(judul, {
      lower: true,
      strict: true,
      remove: /[*+~.()'"!:@]/g,
    });

    await Anime.update(
      {
        slug: slug,
        judul: judul,
        genre: JSON.stringify(genre),
        total_eps: total_eps,
        kualitas: kualitas,
        status: status,
        adaptasi: adaptasi,
        negara: negara,
        studio: studio,
        tipe: tipe,
        musim: musim,
        eksplisit: eksplisit,
        demografis: demografis,
        rating: rating,
        deskripsi: deskripsi,
        skor: skor,
        peminat: peminat,
        kredit: kredit,
        thumbnail: thumbnail,
        durasi: durasi,
      },
      {
        where: {
          id: id,
        },
      }
    );

    res.status(201).json({
      message: "Anime sukses diupdate!!",
    });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};
export const DeleteAnime = async (req, res) => {
  try {
    const { id } = req.params;
    const anime = await Anime.findOne({
      where: {
        id: id,
      },
    });

    if (!anime)
      return res.status(404).json({ error: "Anime tidak ditemukan!!" });

    await Anime.destroy({
      where: {
        id: id,
      },
    });

    res.status(200).json({
      message: "Anime berhasil dihapus!!",
    });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

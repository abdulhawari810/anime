import { Anime, Episode } from "../models/relationship.js";
import { Op } from "sequelize";
export const CreateEpisode = async (req, res) => {
  try {
    const { id } = req.params;
    const { title, videoURL, episodeNumber } = req.body;
    const existing = await Episode.findOne({
      where: {
        [Op.and]: [{ animeID: id }, { episodeNumber }],
      },
    });

    if (existing) {
      return res.status(400).json({ error: "Episode sudah ada" });
    }
    await Episode.create({
      title,
      videoURL: JSON.stringify(videoURL),
      episodeNumber,
      animeID: id,
    });
    return res.status(201).json({ message: "Episode berhasil ditambahkan" });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};
export const CreateAllEpisode = async (req, res) => {
  try {
    const { id } = req.params; // ID anime
    const data = req.body; // array of episode objects

    if (!Array.isArray(data) || data.length === 0) {
      return res.status(400).json({ error: "Data episode kosong!" });
    }

    // Simpan hasil episode yang sukses dan gagal
    const result = {
      success: [],
      failed: [],
    };

    // Loop semua episode dari payload
    for (const ep of data) {
      const episodeNumber = ep.episodeNumber || ep.episode;
      const title = ep.title;
      const videoURL = JSON.stringify(ep.videoURL || ep.sources);

      // Cek apakah sudah ada episode dengan animeID dan episodeNumber ini
      const existing = await Episode.findOne({
        where: {
          [Op.and]: [{ animeID: id }, { episodeNumber }],
        },
      });

      if (existing) {
        result.failed.push({
          episodeNumber,
          reason: "Episode sudah ada",
        });
        continue; // skip yang sudah ada
      }

      // Buat episode baru
      await Episode.create({
        title,
        videoURL,
        episodeNumber,
        animeID: id,
      });

      result.success.push(episodeNumber);
    }

    return res.status(201).json({
      message: "Proses tambah episode selesai",
      totalAdded: result.success.length,
      totalSkipped: result.failed.length,
      result,
    });
  } catch (error) {
    return res.status(500).json({ error: error.message });
  }
};
export const UpdateEpisode = async (req, res) => {};
export const DeleteEpisode = async (req, res) => {};

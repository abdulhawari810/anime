import express from "express";
import multer from "multer";
import path from "path";

import {
  getAllUsers,
  getUsersById,
  UpdateUsers,
  DeleteUsers,
  Login,
  Register,
  Me,
  Logout,
} from "../controller/user.js";
import { verifyToken, verifyAdmin } from "../middleware/verifyToken.js";
import {
  getAllAnime,
  getAnimeById,
  CreateAnime,
  UpdateAnime,
  DeleteAnime,
  getSearchAnime,
} from "../controller/anime.js";
import {
  CreateAllEpisode,
  CreateEpisode,
  DeleteAllEpisode,
  DeleteEpisode,
  getEpisodeById,
  UpdateEpisode,
} from "../controller/episode.js";
import {
  deleteSchedule,
  getSchedule,
  createSchedule,
  getScheduleByDay,
  updateSchedule,
} from "../controller/schedule.js";

const router = express.Router();

const storage = multer.diskStorage({
  destination: (req, file, cb) => cb(null, "uploads/"),
  filename: (req, file, cb) => {
    const uniqueSuffix = Date.now() + "-" + Math.round(Math.random() * 1e9);
    cb(
      null,
      file.fieldname + "-" + uniqueSuffix + path.extname(file.originalname)
    );
  },
});

const fileFilter = (req, file, cb) => {
  const allowed = [
    "image/png",
    "image/jpg",
    "image/jpeg",
    "image/webp",
    "image/gif",
  ];

  if (!allowed.includes(file.mimetype)) {
    return cb(new Error("Tipe tidak valid"), false);
  }

  cb(null, true);
};

const upload = multer({ storage, fileFilter });

// for users
router.post("/login", Login);
router.post("/register", Register);
router.get("/anime", getAllAnime);
router.get("/anime/:slug", getAnimeById);
router.get("/anime/search/:query", getSearchAnime);
router.get("/Me", verifyToken, Me);
router.post("/logout", verifyToken, Logout);
router.get("/episode/:slug/:id", getEpisodeById);

// for admin
// users controller
router.get("/users", verifyToken, verifyAdmin, getAllUsers);
router.get("/users/:id", verifyToken, getUsersById);
router.patch("/users/:id", verifyToken, upload.single("profile"), UpdateUsers);
router.delete("/users/:id", verifyToken, verifyAdmin, DeleteUsers);

// anime controller
router.post("/anime", verifyToken, verifyAdmin, CreateAnime);
router.patch("/anime/:id", verifyToken, verifyAdmin, UpdateAnime);
router.delete("/anime/:id", verifyToken, verifyAdmin, DeleteAnime);

// episode controller
router.post("/episode/:id", verifyToken, verifyAdmin, CreateEpisode);
router.post("/episodeBatch/:id", verifyToken, verifyAdmin, CreateAllEpisode);
router.patch("/episode/:id", verifyToken, verifyAdmin, UpdateEpisode);
router.delete("/episode/:id", verifyToken, verifyAdmin, DeleteEpisode);
router.delete("/episodeAll/:id", verifyToken, verifyAdmin, DeleteAllEpisode);

// schedule controller
router.get("/schedule", verifyToken, verifyAdmin, getSchedule);
router.get("/schedule/:id", verifyToken, verifyAdmin, getScheduleByDay);
router.post("/schedule/:id", verifyToken, verifyAdmin, createSchedule);
router.patch("/schedule/:id", verifyToken, verifyAdmin, updateSchedule);
router.delete("/schedule/:id", verifyToken, verifyAdmin, deleteSchedule);
export default router;

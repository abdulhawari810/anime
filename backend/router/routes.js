import express from "express";
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
} from "../controller/anime.js";
import {
  CreateAllEpisode,
  CreateEpisode,
  DeleteEpisode,
  UpdateEpisode,
} from "../controller/episode.js";

const router = express.Router();

// for users
router.post("/login", Login);
router.post("/register", Register);
router.get("/anime", getAllAnime);
router.get("/anime/:slug", getAnimeById);
router.get("/Me", verifyToken, Me);
router.post("/logout", verifyToken, Logout);

// for admin
// users controller
router.get("/users", verifyToken, verifyAdmin, getAllUsers);
router.get("/users/:id", verifyToken, getUsersById);
router.patch("/users/:id", verifyToken, UpdateUsers);
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
export default router;

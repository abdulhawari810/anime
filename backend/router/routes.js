import express from "express";
import { getAllUsers, getUsersById, UpdateUsers, DeleteUsers, Login, Register, Me } from "../controller/user.js";
import { verifyToken, verifyAdmin } from "../middleware/verifyToken.js";

const router = express.Router();

// for users
router.post('/login', Login);
router.post('/register', Register);


// for admin
router.get('/users',verifyToken,verifyAdmin, getAllUsers);
router.get('/Me',verifyToken , Me);
router.get('/users/:id',verifyToken, getUsersById);
router.patch('/users/:id',verifyToken, UpdateUsers);
router.delete('/users/:id',verifyToken,verifyAdmin, DeleteUsers);


export default router;
import express  from "express";
import cors from "cors"
import dotenv from "dotenv";
import bodyParser from "body-parser";
import db from "./config/db.js";
import router from "./router/routes.js";
import session from "express-session";
import cookieParser from "cookie-parser";

dotenv.config()

const app = express();


( async() => {
    await db.sync();
})();

app.use(session({
    secret: process.env.SESS_SECRET,
    resave: false,
    saveUninitialized: true,
    cookie: {
        secure: 'auto'
    }
}))
app.use(cors({
    credentials: true,
    origin: 'http://localhost:5173'
}))
app.use(express.json())
app.use(bodyParser.json())
app.use(router)
app.use(cookieParser())

app.listen(process.env.APP_PORT, () => console.log('Server up and running!!'));
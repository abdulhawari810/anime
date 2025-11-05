import kungfupanda from "../../../public/kungfupanda.gif";
import { NavLink, useNavigate, Navigate } from "react-router-dom";
import { useAuth } from "../../Context/AuthContext";
import toast from "react-hot-toast";
import { useState, useEffect } from "react";

export default function Login() {
  const [userOREmail, setUserOREmail] = useState("");
  const [password, setPassword] = useState("");

  const nav = useNavigate();
  const { user, login, loading } = useAuth();

  useEffect(() => {
    if (user) {
      toast.error("Anda sudah login!");
    }
  }, [user]);

  if (loading) return null;

  if (user) return <Navigate to="/" replace />;

  const handleLogin = async (e) => {
    e.preventDefault();
    try {
      await login({ userOREmail, password });
      toast.success("Login berhasil!");
      return nav("/");
    } catch (error) {
      if (error.response && error.response.data.error) {
        toast.error(`Registrasi gagal: ${error.response.data.error}`);
      } else {
        console.error("Registration error:", error);
        toast.error(
          error.response?.data?.message || "Terjadi kesalahan saat registrasi."
        );
      }
    }
  };
  return (
    <div className="w-full h-screen flex items-center justify-center">
      <form
        className="w-[70%] bg-white/60 dark:bg-slate-900/70 flex items-center justify-center rounded-lg"
        onSubmit={handleLogin}
      >
        <div className="w-[50%] flex items-end justify-center relative">
          <img
            src={kungfupanda}
            alt="Kung fu Panda"
            loading="lazy"
            className="w-[70%] object-cover translate-y-10"
          />
        </div>
        <div className="w-[50%] py-5 flex items-center justify-center flex-col gap-2.5">
          <h2 className="text-[30px] mb-8 text-slate-300">Pandanime Login</h2>
          <div className="form-group mb-4 w-[70%] h-auto flex items-center justify-center relative rounded-lg">
            <input
              type="text"
              placeholder=" "
              id="username"
              name="username"
              autoComplete="off"
              className="rounded-lg w-full h-11 outline-1 outline-slate-500 not-placeholder-shown:outline-slate-50  focus:outline-slate-50 px-5 text-slate-50"
              onChange={(e) => setUserOREmail(e.target.value)}
            />
            <label htmlFor="username">Username</label>
          </div>
          <div className="form-group w-[70%] h-auto mb-4 flex items-center justify-center relative rounded-lg">
            <input
              type="password"
              placeholder=" "
              id="password"
              name="password"
              autoComplete="off"
              className="rounded-lg w-full h-11 outline-1 outline-slate-500 not-placeholder-shown:outline-slate-50 focus:outline-slate-50 px-5 text-slate-50"
              onChange={(e) => setPassword(e.target.value)}
            />
            <label htmlFor="password">Password</label>
          </div>
          <button className="mt-5 flex items-center justify-center bg-gray-950 rounded-lg text-slate-50 w-[70%] h-11">
            Masuk ke akun
          </button>
          <NavLink
            to="/Auth/Register"
            className="mt-2.5 text-slate-300 hover:underline"
          >
            Belum punya akun? Register
          </NavLink>
        </div>
      </form>
    </div>
  );
}

import { createContext, useContext, useEffect, useState } from "react";
import axios from "axios";

// buat context
const AuthContext = createContext();

// provider
export const AuthProvider = ({ children }) => {
  const [user, setUser] = useState(null); // data user dari backend
  const [loading, setLoading] = useState(true); // status fetch awal
  const [error, setError] = useState(null);

  // konfigurasi axios agar kirim cookie otomatis
  const axiosInstance = axios.create({
    baseURL: "http://localhost:3000/",
    withCredentials: true, // penting: kirim cookie httpOnly
  });

  // ambil data user dari backend
  const fetchUser = async () => {
    try {
      const res = await axiosInstance.get("/Me");
      setUser(res.data.user);
    } catch (err) {
      setUser(null);
      setError(err.response?.data?.message || "Gagal memuat data user");
    } finally {
      setLoading(false);
    }
  };

  // logout
  const logout = async () => {
    try {
      await axiosInstance.post("/logout");
      setUser(null);
    } catch (err) {
      console.error("Logout gagal:", err);
    }
  };

  const login = async (credentials) => {
    await axiosInstance.post("/login", credentials);
    await fetchUser(); // langsung update user setelah login
  };

  useEffect(() => {
    fetchUser();
  }, []);

  // hitung role
  const isAdmin = user?.role === "admin";
  const isUser = user?.role === "user";

  return (
    <AuthContext.Provider
      value={{
        user,
        loading,
        error,
        logout,
        login,
        isAdmin,
        isUser,
        fetchUser,
      }}
    >
      {children}
    </AuthContext.Provider>
  );
};

// custom hook biar mudah dipanggil di komponen
export const useAuth = () => useContext(AuthContext);

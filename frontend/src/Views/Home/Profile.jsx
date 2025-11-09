import { useState } from "react";
import defaultProfile from "../../assets/default.png";
import { useAuth } from "../../Context/AuthContext";
import axios from "axios";
import toast from "react-hot-toast";
import { useNavigate } from "react-router-dom";

export default function Profile() {
  const { user } = useAuth();
  const [usernames, setusernames] = useState("");
  const [emails, setemail] = useState("");
  const [passwords, setpassword] = useState("");
  const [profiles, setprofile] = useState(null);
  const [preview, setPreview] = useState("");

  const base = "http://localhost:3000/users";
  const nav = useNavigate();

  const handleFileChange = async (e) => {
    const selected = e.target.files?.[0];
    if (!selected) return;

    const allowed = [
      "image/png",
      "image/jpg",
      "image/jpeg",
      "image/webp",
      "image/gif",
    ];
    if (!allowed.includes(selected.type)) {
      toast.error("Format gambar tidak valid!");
      e.target.value = "";
      return;
    }

    // Preview langsung berubah
    const previewURL = URL.createObjectURL(selected);
    setPreview(previewURL);

    // Kirim langsung ke backend
    const formData = new FormData();
    formData.append("profile", selected);
    formData.append("username", user.username);
    formData.append("email", user.email);

    try {
      await axios.patch(`${base}/${user.id}`, formData, {
        withCredentials: true,
        headers: { "Content-Type": "multipart/form-data" },
      });
      toast.success("Foto profil berhasil diperbarui!");
      nav(0);
    } catch (err) {
      console.error(err);
      toast.error(err.response?.data?.error || "Gagal mengubah foto profil");
      // kembalikan preview ke foto lama kalau gagal
      setPreview(
        user.profile && user.profile !== "default.png"
          ? `${base.replace("/users", "")}/uploads/${user.profile}`
          : defaultProfile
      );
    }
  };

  console.log(user);
  return (
    <>
      <div className="w-full h-screen px-12">
        <div className="w-full h-auto flex relative">
          <div className="w-full flex items-center justify-center overflow-hidden rounded-2xl">
            <div className="w-full h-[350px] bg-linear-to-br to-indigo-500 from-purple-500"></div>
          </div>
          <img
            src={
              user && user !== null
                ? user.profile && user.profile !== "default.png"
                  ? `${base.replace("/users", "")}/uploads/${user.profile}`
                  : defaultProfile
                : null
            }
            alt={user && user !== null ? user.username : "??"}
            className="rounded-full w-[250px] h-[250px] absolute -bottom-40 border-20 -left-1.5 border-gray-950"
          />
          <form className="absolute text-4xl text-slate-100 -bottom-32 left-44  rounded-full p-4">
            <input
              type="file"
              name="profile"
              id="profiles"
              onChange={handleFileChange}
              className="hidden"
            />
            <label
              htmlFor="profiles"
              className="absolute text-4xl top-0 -translate-y-10 -translate-x-2 text-slate-100 bg-gray-950 rounded-full p-4"
            >
              <i className="ri-image-edit-line"></i>
            </label>
          </form>
        </div>
        <div className="w-full h-auto flex flex-col relative bg-amber-200">
          <div className="absolute top-5 left-64 flex flex-col">
            <h1 className="text-4xl text-slate-100 font-bold">
              {user && user !== null ? user.username : "??"}
            </h1>
            <span className="text-2xl text-slate-300 cursor-pointer">
              {user && user !== null ? user.email : "??"}
            </span>
          </div>
        </div>
      </div>
    </>
  );
}

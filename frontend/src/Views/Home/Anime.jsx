import { useState } from "react";
import Breadcrumb from "../../Components/Breadcrumb";
import Card from "../../Components/Card";
import { NavLink } from "react-router-dom";
import axios from "axios";
import useSWR from "swr";
import { UsersRound } from "lucide-react";

export default function Anime() {
  const [gen, setgen] = useState("");
  const [alpha, setalpha] = useState("All");
  const [days, setdays] = useState("");
  const base = "http://localhost:3000/Anime";

  const fetch = async (url) => {
    const res = await axios.get(url);
    return res.data.anime;
  };

  const { data, isLoading, error } = useSWR(`${base}`, fetch);

  const alphabet = [
    "All",
    ...Array.from({ length: 26 }, (_, i) => String.fromCharCode(65 + i)),
  ];
  const genre = [
    "Semua",
    "Action",
    "Adventure",
    "Adult Cast",
    "Anthropomorphic",
    "Avant Garde",
    "Award Winning",
    "Boys Love",
    "CGDCT",
    "Childcare",
    "Combat Sports",
    "Comedy",
    "Crossdressing",
    "Delinquents",
    "Detective",
    "Drama",
    "Ecchi",
    "Educational",
    "Erotica",
    "Fantasy",
    "Gag Humor",
    "Girls Love",
    "Gore",
    "Gourmet",
    "Harem",
    "Hentai",
    "High Stakes Game",
    "Historical",
    "Horror",
    "Idols(Female)",
    "Idols(Male)",
    "Isekai",
    "lyashikei",
    "Josei",
    "Kids",
    "Love Polygon",
    "Love Status Quo",
    "Magical Sex Shift",
    "Mahou Shoujo",
    "Martial Arts",
    "Mecha",
    "Medical",
    "Military",
    "Music",
    "Mistery",
    "Mythology",
    "Organized Crime",
    "Otaku Culture",
    "Parody",
    "Performing Arts",
    "Pets",
    "Psychological",
    "Racing",
    "Reincarnation",
    "Reverse Harem",
    "Romance",
    "Romantic Subtext",
    "Samurai",
    "School",
    "Sci-fi",
    "Seinen",
    "Shoujo",
    "Shounen",
    "Showbiz",
    "Slice Of Life",
    "Space",
    "Sports",
    "Strategy Game",
    "Super Power",
    "Supernatural",
    "Survival",
    "Suspense",
    "Team Sports",
    "Time Travel",
    "Urban Fantasy",
    "Vampire",
    "Video Game",
    "Villaines",
    "Visual Arts",
    "Workplace",
  ];
  const day = [
    "Semua",
    "Senin",
    "Selasa",
    "Rabu",
    "Kamis",
    "Jumat",
    "Sabtu",
    "Minggu",
  ];

  if (isLoading)
    return (
      <div className="flex items-center justify-center min-h-screen bg-[#0a0a0f] text-white text-xl">
        Memuat episode...
      </div>
    );

  if (error || !data)
    return (
      <div className="flex items-center justify-center min-h-screen bg-[#0a0a0f] text-red-400 text-xl">
        Gagal memuat video.
      </div>
    );

  return (
    <div className="w-full min-h-screen bg-[#0a0a0f] text-slate-100 px-10 py-8">
      <div className="w-full flex flex-col fixed px-10 left-0 z-40 bg-slate-900/70 top-[70px]">
        {/* Header */}
        <div className="flex items-center justify-between flex-wrap gap-4">
          <h1 className="text-3xl font-bold text-transparent bg-clip-text bg-linear-to-r from-purple-400 to-indigo-500">
            Daftar Anime
          </h1>

          <div className="flex items-center gap-3">
            <select
              value={gen}
              onChange={(e) => setgen(e.target.value)}
              className="bg-[#15151f] px-4 py-3 rounded-xl text-sm border border-gray-800 hover:border-indigo-600 transition focus:outline-none"
            >
              {genre.map((q) => (
                <option key={q} value={q}>
                  {q.toUpperCase()}
                </option>
              ))}
            </select>

            <select
              value={days}
              onChange={(e) => setdays(e.target.value)}
              className="bg-[#15151f] px-4 py-3 rounded-xl text-sm border border-gray-800 hover:border-indigo-600 transition focus:outline-none"
            >
              {day.map((q) => (
                <option key={q} value={q}>
                  {q.toUpperCase()}
                </option>
              ))}
            </select>

            <select
              value={alpha}
              onChange={(e) => setalpha(e.target.value)}
              className="bg-[#15151f] px-4 py-3 rounded-xl text-sm border border-gray-800 hover:border-indigo-600 transition focus:outline-none"
            >
              {alphabet.map((q) => (
                <option key={q} value={q}>
                  {q.toUpperCase()}
                </option>
              ))}
            </select>
          </div>
        </div>

        {/* Filter Tabs */}
        <div className="flex flex-wrap gap-3 my-5">
          {["Semua", "Update Terbaru", "Rilis Terbaru", "Populer"].map(
            (btn, i) => (
              <span
                key={i}
                className="cursor-pointer px-5 py-3 rounded-xl bg-linear-to-br from-purple-700 to-indigo-700 text-white font-semibold hover:shadow-indigo-500 shadow transition"
              >
                {btn}
              </span>
            )
          )}
        </div>
      </div>
      <div className="flex flex-col gap-6 pt-14">
        {/* Card Grid */}
        <Card type="wrap">
          {Array.isArray(data) &&
            data.map((anime, i) => (
              <NavLink
                key={i}
                to={`/Anime/Detail/${anime.slug}`}
                className="flex flex-col w-[200px] bg-[#15151f] rounded-2xl  hover:scale-[1.03] hover:shadow-indigo-600 shadow-md transition relative mt-10"
              >
                <img
                  src={anime.thumbnail}
                  alt={anime.judul}
                  className="w-full h-[200px] object-cover rounded-t-2xl"
                />
                <div className="flex flex-col p-4">
                  <h1
                    className="text-slate-50 font-bold text-lg truncate mb-3"
                    title={anime.judul}
                  >
                    {anime.judul}
                  </h1>
                  <span className="text-slate-400 text-sm mt-1">
                    Total Episode {anime.total_eps || "??"}
                  </span>
                  <span
                    className={`${
                      anime.status === "Selesai Tayang"
                        ? "text-green-400"
                        : "text-amber-400"
                    } text-sm mt-1`}
                  >
                    {anime.status || "N/A"}
                  </span>
                </div>
                <div className="flex p-2.5 items-center justify-between gap-2 text-md text-gray-400">
                  <span>⭐ {anime.skor ?? "N/A"} / 10</span>
                  <div className="flex items-center gap-1">
                    <UsersRound className="w-5 h-5" />{" "}
                    <span>
                      {Intl.NumberFormat("id-ID", {
                        notation: "compact",
                        maximumFractionDigits: 1,
                      }).format(anime.peminat) || 0}
                    </span>
                  </div>
                </div>
              </NavLink>
            ))}
        </Card>
      </div>
    </div>
  );
}

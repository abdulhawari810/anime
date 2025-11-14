import axios from "axios";
import { useParams, NavLink } from "react-router-dom";
import useSWR from "swr";
import ReactPlayer from "react-player";
import { useState, useEffect } from "react";

export default function Episode() {
  const { id, slug } = useParams();
  const base = "http://localhost:3000/";

  const [eps, setEps] = useState([]);
  const [quality, setQuality] = useState("720p");
  const [videoURL, setVideoURL] = useState(null);
  const [animes, setAnime] = useState([]);

  const fetcher = async (url) => {
    const res = await axios.get(url);
    const a = await axios.get(`${base}anime/${slug}`);
    setAnime(a.data.anime);
    // Ambil semua episode untuk daftar di samping
    setEps(res.data.AllEpisode || []);
    return res.data.episode;
  };

  const { data, isLoading, error } = useSWR(
    `${base}episode/${slug}/${id}`,
    fetcher
  );
  useEffect(() => {
    if (data?.videoURL) {
      try {
        const parsed =
          typeof data.videoURL === "string"
            ? JSON.parse(data.videoURL)
            : data.videoURL;
        setVideoURL(parsed);
      } catch (err) {
        console.error("Gagal parse videoURL:", err);
      }
    }
  }, [data]);

  if (isLoading)
    return (
      <div className="flex items-center justify-center min-h-screen bg-gray-900 text-white text-xl">
        Memuat episode...
      </div>
    );

  if (error || !data)
    return (
      <div className="flex items-center justify-center min-h-screen bg-gray-900 text-red-400 text-xl">
        Gagal memuat video.
      </div>
    );

  return (
    <div className="p-4 bg-gray-900 min-h-screen text-white">
      <div className="w-full mx-auto flex flex-col lg:flex-row gap-6 px-4 md:px-8">
        {/* VIDEO PLAYER */}
        <div className="w-full lg:w-[65%] relative rounded-2xl overflow-hidden shadow-lg border border-gray-700 aspect-video bg-black">
          {videoURL ? (
            <ReactPlayer
              src={videoURL[quality]} // ✅ gunakan 'url', bukan 'src'
              controls={true}
              width="100%"
              height="100%"
              className="react-player"
              light={
                <img
                  src={`${base}storage/thumbnail/${animes.slug.slice(0, 11)}/${
                    data?.sampul
                  }`}
                  alt={data?.title}
                  className="w-full h-full object-cover rounded-t-2xl mb-2.5"
                />
              }
              config={{
                file: {
                  attributes: {
                    controlsList: "nodownload",
                  },
                },
              }}
            />
          ) : (
            <div className="flex items-center justify-center h-full bg-gray-800 text-gray-400">
              Tidak ada sumber video
            </div>
          )}

          {/* DROPDOWN KUALITAS */}
          {videoURL && (
            <div className="absolute top-4 right-4 bg-gray-800/80 backdrop-blur-sm rounded-lg border border-gray-700 px-3 py-1 w-[130px]">
              <select
                value={quality}
                onChange={(e) => setQuality(e.target.value)}
                className="w-full bg-gray-900 text-white text-sm focus:outline-none cursor-pointer"
              >
                {Object.keys(videoURL).map((q) => (
                  <option key={q} value={q}>
                    {q.toUpperCase()}
                  </option>
                ))}
              </select>
            </div>
          )}
        </div>

        {/* SEMUA EPISODE */}
        <div className="w-[40%] bg-gray-800/60 rounded-xl border border-gray-700 max-h-[500px] overflow-hidden pb-5">
          <h1 className="p-5 text-2xl font-semibold text-slate-50">
            Semua Episode
          </h1>

          <div className="p-5 flex justify-around items-center flex-wrap gap-3 overflow-scroll w-full max-h-[500px] relative pb-24">
            {Array.isArray(eps) &&
              eps.map((e, i) => (
                <NavLink
                  key={i}
                  to={`/Episode/${e.animeID}/${e.episodeNumber}`}
                  className={({ isActive }) =>
                    `group relative z-50  transition rounded-lg w-[70px] h-[70px]  flex items-center justify-center ${
                      isActive
                        ? "ring-2 ring-indigo-500 border-indigo-500 bg-gray-950"
                        : ""
                    }`
                  }
                >
                  <span
                    className={`text-sm z-10 font-medium  rounded-lg hover:bg-gray-950 w-full flex items-center justify-center h-full border border-gray-700  `}
                  >
                    {e.episodeNumber}
                  </span>
                  {/* Hover Title */}
                  <span
                    className={`absolute opacity-0 scale-90 group-hover:opacity-100 group-hover:scale-100 transition-all text-center z-50 top-0  bg-gray-900 px-3 py-1 text-xs text-indigo-400 rounded-lg border border-gray-700 whitespace-nowrap left-1/2 -translate-x-1/2 `}
                  >
                    {e.title}
                  </span>
                </NavLink>
              ))}
          </div>
        </div>
      </div>
    </div>
  );
}

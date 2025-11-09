import { Outlet, NavLink } from "react-router-dom";
import { Toaster } from "react-hot-toast";

export default function Admin() {
  return (
    <div className="pt-[100px]">
      <Toaster position="top-center" reverseOrder={false} />
      <nav
        className="flex items-center justify-between px-10 border-slate-200/30 dark:border-slate-700/60
          bg-white/60 dark:bg-slate-900/90 fixed top-0 left-0 z-50 w-full h-20"
      >
        <div>
          <NavLink to="/" className="flex items-center gap-3">
            <div className="w-10 h-10 rounded-md bg-linear-to-br from-indigo-500 to-purple-600 flex items-center justify-center shadow-md">
              <span className="text-white font-bold text-lg">P</span>
            </div>
            <div className="hidden sm:block">
              <h1 className="text-slate-900 dark:text-slate-100 text-lg font-bold leading-none">
                Pandanime
              </h1>
              <p className="text-xs text-slate-600 dark:text-slate-400 -mt-0.5">
                Admin Pages
              </p>
            </div>
          </NavLink>
        </div>
        <div className="flex items-center gap-5">
          <span className="text-2xl text-slate-400">
            <i className="ri-search-line"></i>
          </span>
          <span className="text-2xl text-slate-400">
            <i className="ri-notification-4-line"></i>
          </span>
          <span className="text-2xl text-slate-400">
            <i className="ri-user-line"></i>
            <i className="ri-arrow-down-s-line"></i>
          </span>
        </div>
      </nav>

      <div className="flex pl-[20%]">
        <aside
          className="border-slate-200/30 dark:border-slate-700/60
          bg-white/60 dark:bg-slate-900/70 w-[20%] h-screen fixed top-0 left-0 flex flex-col pt-[100px] px-2.5 gap-5"
        >
          <NavLink
            className={({ isActive }) =>
              isActive
                ? "w-full h-11 flex items-center px-5 gap-2.5 text-slate-100 bg-indigo-600/70 rounded-lg text-[18px] hover:bg-indigo-600/70 hover:text-slate-100"
                : "w-full h-11 flex items-center px-5 gap-2.5 text-slate-400  rounded-lg text-[18px] hover:bg-indigo-600/70 hover:text-slate-100"
            }
            to={"/Admin/Dashboard"}
          >
            <i className="ri-dashboard-line text-2xl"></i>
            <span>Dashboard</span>
          </NavLink>
          <NavLink
            className={({ isActive }) =>
              isActive
                ? "w-full h-11 flex items-center px-5 gap-2.5 text-slate-100 bg-indigo-600/70 rounded-lg text-[18px] hover:bg-indigo-600/70 hover:text-slate-100"
                : "w-full h-11 flex items-center px-5 gap-2.5 text-slate-400  rounded-lg text-[18px] hover:bg-indigo-600/70 hover:text-slate-100"
            }
            to={"/Admin/Users"}
          >
            <i className="ri-group-line text-2xl"></i>
            <span>Pengolaan users</span>
          </NavLink>
          <NavLink
            className={({ isActive }) =>
              isActive
                ? "w-full h-11 flex items-center px-5 gap-2.5 text-slate-100 bg-indigo-600/70 rounded-lg text-[18px] hover:bg-indigo-600/70 hover:text-slate-100"
                : "w-full h-11 flex items-center px-5 gap-2.5 text-slate-400  rounded-lg text-[18px] hover:bg-indigo-600/70 hover:text-slate-100"
            }
            to={"/Admin/Anime"}
          >
            <i className="ri-database-line text-2xl"></i>
            <span>Pengolaan Anime</span>
          </NavLink>
          <NavLink
            className={({ isActive }) =>
              isActive
                ? "w-full h-11 flex items-center px-5 gap-2.5 text-slate-100 bg-indigo-600/70 rounded-lg text-[18px] hover:bg-indigo-600/70 hover:text-slate-100"
                : "w-full h-11 flex items-center px-5 gap-2.5 text-slate-400  rounded-lg text-[18px] hover:bg-indigo-600/70 hover:text-slate-100"
            }
            to={"/Admin/Carousels"}
          >
            <i className="ri-multi-image-line text-2xl"></i>
            <span>Carousel</span>
          </NavLink>
          <NavLink
            className={({ isActive }) =>
              isActive
                ? "w-full h-11 flex items-center px-5 gap-2.5 text-slate-100 bg-indigo-600/70 rounded-lg text-[18px] hover:bg-indigo-600/70 hover:text-slate-100"
                : "w-full h-11 flex items-center px-5 gap-2.5 text-slate-400  rounded-lg text-[18px] hover:bg-indigo-600/70 hover:text-slate-100"
            }
            to={"/Admin/Report"}
          >
            <i className="ri-megaphone-line text-2xl"></i>
            <span>Laporan Bug</span>
          </NavLink>
        </aside>
        <Outlet />
      </div>
    </div>
  );
}

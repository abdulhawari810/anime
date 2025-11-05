import { Outlet } from "react-router-dom";
import Navbar from "../Components/Navbar";
import { Toaster } from "react-hot-toast";

export default function Admin() {
  return (
    <div className="pt-[100px]">
      <Toaster position="top-center" reverseOrder={false} />
      <Navbar layout={"admin"} />
      <Outlet />
    </div>
  );
}

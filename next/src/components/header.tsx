import Image from "next/image";
import logo from "@/assets/logo.svg";
import Link from "next/link";

export function Header() {
  return (
    <header className="bg-white/30 py-4 fixed top-0 z-50 inset-x-0 backdrop-blur-md">
      <div className="container mx-auto flex items-center">
        <Link href="/">
          <Image src={logo} alt="logo" height={30} />
        </Link>

        <nav className="ms-auto">
          <ul className="flex items-center gap-4">
            <li className="text-white font-semibold tracking-tight">
              <Link href="/">Home</Link>
            </li>

            <li>
              <Link href="#">FAQ</Link>
            </li>

            <li>
              <Link href="#">About Us</Link>
            </li>

            <li>
              <Link href="/auth/login">Login</Link>
            </li>
          </ul>
        </nav>
      </div>
    </header>
  );
}

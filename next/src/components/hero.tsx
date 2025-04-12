import Image from "next/image";
import { Button } from "./ui/button";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faPlayCircle } from "@fortawesome/free-solid-svg-icons";

export function Hero() {
  return (
    <section className="h-[90dvh] relative bg-gray-300 animate pulse">
      <Image
        src="https://images.unsplash.com/photo-1557804506-e969d7b32a4b?q=80&w=2890&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
        fill
        alt="hero"
        className="object-cover"
      />

      <div className="absolute inset-0 bg-gradient-to-t from-[#1a1a1a] via-transparent to-transparent">
        <div className="absolute bottom-12 start-8">
          <h1 className="text-7xl font-bold tracking-tight text-white">
            ShowTV
          </h1>

          <p className="text-lg tracking-wide font-light max-w-prose text-gray-200 mt-1">
            Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ratione
            vero, recusandae minima iste eaque quos est aliquid quam labore,
            sint, provident harum? Atque quia ratione libero ullam perferendis
            expedita nemo.
          </p>

          <a href="#latest">
            <Button size="lg" className="mt-6">
              Watch Now <FontAwesomeIcon icon={faPlayCircle} />
            </Button>
          </a>
        </div>
      </div>
    </section>
  );
}

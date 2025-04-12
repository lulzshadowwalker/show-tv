import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  /* config options here */
  images: {
    remotePatterns: [
      {
        hostname: "**.unsplash.com",
      },
      {
        hostname: "**.laravel.cloud",
      },
      {
        hostname: "placehold.co",
      },
    ],
  },
};

export default nextConfig;

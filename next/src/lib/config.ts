export const config = {
  get laravelBaseUrl(): string {
    const url = process.env.NEXT_PUBLIC_LARAVEL_BASE_URL;
    if (!url) {
      throw new Error("laravel base url not set");
    }

    return url;
  },
};

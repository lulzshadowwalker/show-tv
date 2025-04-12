"use server";

import { cookies } from "next/headers";

export async function getToken(): Promise<string | undefined> {
  return (await cookies()).get("auth-cookie")?.value;
}

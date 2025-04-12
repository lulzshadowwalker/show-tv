"use server";

import { redirect } from "next/navigation";
import { cookies } from "next/headers";

export async function logout(): Promise<void> {
  (await cookies()).delete("auth-cookie");
  redirect("/auth/login");
}

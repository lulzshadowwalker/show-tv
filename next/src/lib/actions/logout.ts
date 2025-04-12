"use server";

import { cookies } from "next/headers";

export async function logout(): Promise<void> {
  (await cookies()).delete("auth-cookie");
}

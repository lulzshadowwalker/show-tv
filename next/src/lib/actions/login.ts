"use server";

import { cookies } from "next/headers";
import { InvalidLoginError } from "../errors/invalid-login-error";
import { AuthRepoFactory } from "../factory/auth-repo-factory";
import { redirect } from "next/navigation";

export async function login(
  email: string,
  password: string
): Promise<string | undefined> {
  try {
    const token = await AuthRepoFactory.make().login(email, password);

    (await cookies()).set({
      name: "auth-cookie",
      path: "/",
      maxAge: 9900,
      httpOnly: true,
      value: token,
    });
  } catch (e) {
    if (e instanceof InvalidLoginError) {
      return "incorrect email or password";
    }

    console.error(e);
    return "something went wrong";
  }

  redirect("/");
}

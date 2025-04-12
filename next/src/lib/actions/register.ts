"use server";

import { cookies } from "next/headers";
import { AuthRepoFactory } from "../factory/auth-repo-factory";
import { EmailAlreadyExistsError } from "../errors/email-already-exists-error";
import { redirect } from "next/navigation";

export async function register(
  name: string,
  email: string,
  password: string
): Promise<string | undefined> {
  try {
    const token = await AuthRepoFactory.make().register(name, email, password);

    (await cookies()).set({
      name: "auth-cookie",
      path: "/",
      maxAge: 9900,
      httpOnly: true,
      value: token,
    });
  } catch (e) {
    if (e instanceof EmailAlreadyExistsError) {
      return "email already exists";
    }

    console.error(e);
    return "something went wrong";
  }

  redirect("/");
}

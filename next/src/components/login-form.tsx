"use client";

import { cn } from "@/lib/utils";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import Link from "next/link";
import { FormEvent } from "react";
import { login } from "@/lib/actions/login";
import { toast } from "sonner";
import { SubmitButton } from "./submit-button";

export function LoginForm({
  className,
  ...props
}: React.ComponentProps<"form">) {
  async function handleSubmit(e: FormEvent) {
    e.preventDefault();

    const form = new FormData(e.target as HTMLFormElement);
    const message = await login(
      form.get("email") as string,
      form.get("password") as string
    );

    if (message) toast(message);
  }

  return (
    <form
      className={cn("flex flex-col gap-6", className)}
      {...props}
      onSubmit={handleSubmit}
    >
      <div className="flex flex-col items-center gap-2 text-center">
        <h1 className="text-2xl font-bold">Login to your account</h1>
        <p className="text-muted-foreground text-sm text-balance">
          Enter your email below to login to your account
        </p>
      </div>
      <div className="grid gap-6">
        <div className="grid gap-3">
          <Label htmlFor="email">Email</Label>
          <Input
            id="email"
            type="email"
            placeholder="m@example.com"
            required
            name="email"
          />
        </div>
        <div className="grid gap-3">
          <div className="flex items-center">
            <Label htmlFor="password">Password</Label>
          </div>
          <Input id="password" type="password" required name="password" />
        </div>

        <SubmitButton>Login</SubmitButton>
      </div>
      <div className="text-center text-sm">
        Don&apos;t have an account?{" "}
        <Link href="/auth/register" className="underline underline-offset-4">
          Sign up
        </Link>
      </div>
    </form>
  );
}

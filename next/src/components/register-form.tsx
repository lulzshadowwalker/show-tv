"use client";

import { cn } from "@/lib/utils";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import Link from "next/link";
import { toast } from "sonner";
import { register } from "@/lib/actions/register";
import { FormEvent } from "react";
import { SubmitButton } from "./submit-button";

export function RegisterForm({
  className,
  ...props
}: React.ComponentProps<"form">) {
  async function handleSubmit(e: FormEvent) {
    e.preventDefault();

    const form = new FormData(e.target as HTMLFormElement);
    const message = await register(
      form.get("name") as string,
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
        <h1 className="text-2xl font-bold">Register a new account</h1>
        <p className="text-muted-foreground text-sm text-balance">
          Enter your details below
        </p>
      </div>
      <div className="grid gap-6">
        <div className="grid gap-3">
          <Label htmlFor="email">Name</Label>
          <Input
            id="name"
            type="text"
            placeholder="John Doe"
            required
            name="name"
          />
        </div>
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
        <SubmitButton>Register</SubmitButton>
      </div>
      <div className="text-center text-sm">
        Already have an account?{" "}
        <Link href="/auth/login" className="underline underline-offset-4">
          Login
        </Link>
      </div>
    </form>
  );
}

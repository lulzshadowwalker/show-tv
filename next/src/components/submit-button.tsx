"use client";

import { ReactNode } from "react";
import { Button } from "./ui/button";
import { useFormStatus } from "react-dom";
import { cn } from "@/lib/utils";

export function SubmitButton({ children }: { children: ReactNode }) {
  const { pending } = useFormStatus();

  return (
    <Button type="submit" className="w-full" disabled={pending}>
      <div
        className={cn(
          "h-3 w-3 border-2 border-r-0 border-b-0 animate-spin rounded-full",
          {
            hidden: !pending,
          }
        )}
      ></div>
      {children}
    </Button>
  );
}

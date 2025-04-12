"use client";

import {
  createContext,
  ReactNode,
  useContext,
  useEffect,
  useState,
} from "react";
import { getToken } from "../actions/token";

type State = {
  token?: string;
  authenticated: boolean;
};

const AuthContext = createContext<State | null>(null);

export function AuthProvider({ children }: { children: ReactNode }) {
  const [token, setToken] = useState<string>();
  const authenticated = !!token;

  useEffect(() => {
    getToken().then((token) => {
      console.log("token", token);
      setToken(token);
    });
  }, []);

  return (
    <AuthContext.Provider value={{ token, authenticated }}>
      {children}
    </AuthContext.Provider>
  );
}

export function useAuth() {
  const context = useContext(AuthContext);
  if (!context) {
    throw new Error("useAuth must be used within an AuthProvider");
  }

  return context;
}

export type AccessToken = string;

export interface AuthRepo {
  login(email: string, password: string): Promise<AccessToken>;
  register(name: string, email: string, password: string): Promise<AccessToken>;
  logout(): Promise<void>;
}

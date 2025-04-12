import { config } from "../config";
import { AccessToken, AuthRepo } from "../contract/auth-repo";
import { EmailAlreadyExistsError } from "../errors/email-already-exists-error";
import { InvalidLoginError } from "../errors/invalid-login-error";

export class LaravelAuthRepo implements AuthRepo {
  async login(email: string, password: string): Promise<AccessToken> {
    const response = await fetch(`${config.laravelBaseUrl}/auth/login`, {
      method: "post",
      headers: {
        accept: "application/json",
        "content-type": "application/json",
      },
      body: JSON.stringify({
        data: {
          attributes: {
            email,
            password,
          },
        },
      }),
    });

    if (response.ok) {
      return (await response.json())["data"]["attributes"]["token"];
    }

    if (response.status === 403) {
      throw new InvalidLoginError();
    }

    throw new Error(`failed to login because ${response.statusText}`);
  }

  async register(
    name: string,
    email: string,
    password: string
  ): Promise<AccessToken> {
    const response = await fetch(`${config.laravelBaseUrl}/auth/register`, {
      method: "post",
      headers: {
        accept: "application/json",
        "content-type": "application/json",
      },
      body: JSON.stringify({
        data: {
          attributes: {
            name,
            email,
            password,
          },
        },
      }),
    });

    if (response.ok) {
      return (await response.json())["data"]["attributes"]["token"];
    }

    if (response.status === 422) {
      throw new EmailAlreadyExistsError();
    }

    throw new Error(`failed to register because ${response.statusText}`);
  }

  async logout(): Promise<void> {
    //
  }
}

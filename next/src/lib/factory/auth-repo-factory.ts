import { AuthRepo } from "../contract/auth-repo";
import { LaravelAuthRepo } from "../repo/laravel-auth-repo";

export class AuthRepoFactory {
  static make(): AuthRepo {
    return new LaravelAuthRepo();
  }
}

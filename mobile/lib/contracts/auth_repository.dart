typedef AccessToken = String;

abstract interface class AuthRepository {
  Future<AccessToken> login(String email, String password);
  Future<AccessToken> register(String name, String email, String password);
  Future<void> logout();
}

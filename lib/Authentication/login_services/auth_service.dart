
abstract class AuthService {
  Future<bool> login([String email, String password]);
  Future<bool> logout();
  Future<bool> isLoggedIn();
  Future<bool> createAccount(String email, String password);
}
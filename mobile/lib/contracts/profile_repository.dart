import 'package:showtv/models/user.dart';

abstract interface class ProfileRepository {
  Future<User> fetch(String accessToken);
}

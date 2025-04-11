import 'package:dio/dio.dart';
import 'package:showtv/contracts/profile_repository.dart';
import 'package:showtv/models/user.dart';

class LaravelProfileRepository implements ProfileRepository {
  @override
  Future<User> fetch(String accessToken) async {
    final response = await Dio(
      BaseOptions(validateStatus: (status) => true),
    ).get(
      'https://show-tv-master-0oh5a1.laravel.cloud/api/me',
      options: Options(
        headers: {
          'accept': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
      ),
    );

    return User.fromJson(response.data['data']);
  }
}

import 'package:dio/dio.dart';
import 'package:showtv/contracts/auth_repository.dart';
import 'package:showtv/errors/email_already_in_use_error.dart';
import 'package:showtv/errors/invalid_login_error.dart';
import 'package:showtv/models/episode.dart';

class LaravelAuthRepository implements AuthRepository {
  @override
  Future<List<Episode>> list() async {
    final response = await Dio(
      BaseOptions(validateStatus: (status) => true),
    ).get('https://show-tv-master-0oh5a1.laravel.cloud/api/episodes');

    return (response.data['data'] as List)
        .map((series) => Episode.fromJson(series))
        .toList();
  }

  @override
  Future<AccessToken> login(String email, String password) async {
    final response = await Dio(
      BaseOptions(validateStatus: (status) => true),
    ).post(
      'https://show-tv-master-0oh5a1.laravel.cloud/api/auth/login',
      data: {
        'data': {
          'attributes': {'email': email, 'password': password},
        },
      },
    );

    if (response.statusCode == 403) {
      throw InvalidLoginError();
    }

    if (response.statusCode != 200) {
      throw Exception('failed to login');
    }

    return response.data['data']['attributes']['token'];
  }

  @override
  Future<AccessToken> register(
    String name,
    String email,
    String password,
  ) async {
    final response = await Dio(
      BaseOptions(validateStatus: (status) => true),
    ).post(
      'https://show-tv-master-0oh5a1.laravel.cloud/api/auth/register',
      data: {
        'data': {
          'attributes': {'name': name, 'email': email, 'password': password},
        },
      },
    );

    //  NOTE: This is because we only provided a sample for global error handling in the backend
    if (response.statusCode == 500) {
      throw EmailAlreadyInUseError();
    }

    if (response.statusCode != 200) {
      throw Exception('failed to register ${response.statusMessage}');
    }

    return response.data['data']['attributes']['token'];
  }

  @override
  Future<void> logout() async {
    //
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  static String? _accessToken;
  //static String? _updateProfile;

  static String? get accessToken => _accessToken;
  //static String? get updateProfile => _updateProfile;

  static Future<void> setAccessToken(String token) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setString('access_token', token);
    _accessToken = token;
  }

/*
  static Future<void> setReadProfile(String readProfile) async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    await sharedPreferences.setString('read_profile', readProfile);
    _updateProfile = readProfile;
  }
*/

  static Future<void> getAccessToken() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    _accessToken = sharedPreferences.getString('access_token');
  }

/*
  static Future<void> getReadProfile() async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    _updateProfile = sharedPreferences.getString('read_profile');
  }
*/

  static Future<void> saveProfileDetails(String data) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('user-data', data);
  }

  static Future<void> clear() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }

  static bool get isLoggedIn {
    return _accessToken != null;
  }
}

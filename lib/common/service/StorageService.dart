import 'package:learnflutterapp/common/constants/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService{
  late final SharedPreferences _prefs;

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    // _prefs.setBool(Constants.DEVICE_ALREADY_OPEN_BEFORE, false);

    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  bool getDeviceFirstOpenApp(){
    return _prefs.getBool(Constants.DEVICE_ALREADY_OPEN_BEFORE) ?? false;
  }


  Future<void> saveLoginInfo(String accessToken, String refreshToken, String userString) async {
    await _prefs.setString(Constants.ACCESS_TOKEN, accessToken);
    await _prefs.setString(Constants.REFRESH_TOKEN, refreshToken);
    await _prefs.setString(Constants.USER, userString);

    DateTime dateTime = DateTime.now();
    await _prefs.setInt(Constants.EXPIRE_IN, dateTime.add(const Duration(hours: 1)).millisecondsSinceEpoch);
  }
}
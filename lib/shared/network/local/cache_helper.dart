import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setbooleandata({
    required String key,
    bool value = false  ,
  }) {
    return sharedPreferences!.setBool(key, value) ; 
  }


  static  bool ? getbooleandata(
    {
      required String key 
    }
  ){
    return sharedPreferences?.getBool(key) ; 
  }
}

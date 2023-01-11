import 'dart:ui' as ui;

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_list_app/mangers/shared_preference_helper.dart';

class UserCredentialsManger {



  static saveLanguage(String language)  {
    sharedPrefs.setString("language", language);

  }



  static String getLanguage()  {
    String ? r=sharedPrefs.getString('language');
    return r==null?"English":sharedPrefs.getString('language');
  }


}

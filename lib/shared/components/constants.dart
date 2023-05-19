
//https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=c6de3f70e0dc4c4588c5d8ea1a6f772a
//https://newsapi.org/v2/everything?q=tesla&apiKey=c6de3f70e0dc4c4588c5d8ea1a6f772a

import 'package:flutter/cupertino.dart';
import '../../modules/childern_app/login/login_screan.dart';
import '../../modules/childern_app/welcom/welcom_screan.dart';
import '../network/local/cache_helper.dart';
import 'components.dart';

void signOut(BuildContext context) {
   CacheHelper.removeData(key: 'uid').then((value) {
    if (value) {
      navigateAndFinish(
          context,
          Login_Screan());
    }
  });
}
  void printFulltext (String text)
  {
    final pattern=RegExp('.{1,800}');
    pattern.allMatches(text).forEach((match)=>print(match.group(0)));
  }
//var token='';
// ./gradlew signingReport
//multiDexEnabled true
var uid;

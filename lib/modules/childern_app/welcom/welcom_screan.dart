
import 'package:childern_health_care/shared/styles/colores.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../shared/components/components.dart';
import '../../../shared/network/local/cache_helper.dart';
import '../login/login_screan.dart';


class Welcome_Screan extends StatelessWidget {
  const Welcome_Screan({Key? key}) : super(key: key);

  dynamic submit(BuildContext context){
    CacheHelper.saveData(
        key: 'welcome',
        value:true,
    ).then((value){
      if(value){
        navigateAndFinish(
            context,
            Login_Screan());
      }
    }).catchError((error){
      print(error.toString());
    });
  }
  @override
  Widget build(BuildContext context) {
    var mediaquer=MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
      body: Padding(
        padding:  mediaquer.systemGestureInsets,
        child: Center(
            child: Column(
              children: [
                Text(
                    'WELCOM TO',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: mediaquer.size.height*0.04,
                ),
                Text(
                  'CHILDERN HEALTH',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
               SizedBox(
                  height: mediaquer.size.height*0.001,
                ),

                Text(
                    'CARE',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                SizedBox(
                  height: mediaquer.size.height*0.04,
                ),
                Image(
                    image: AssetImage('assets/images/logo.png'),
                     width: mediaquer.size.width*0.42,
                     height: mediaquer.size.height*0.35,
                ),
                SizedBox(
                  height: mediaquer.size.height*0.12,
                ),
                Container(
                  height:mediaquer.size.height*0.08,
                  child: MaterialButton(
                    onPressed: (){
                      submit(context);
                      navigateTo(
                        context,
                        Login_Screan(),
                      );
                    },
                    child: Text(
                      'get started'.toUpperCase(),
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: defultColor,
                  ),
                ),

              ],
            ),
          ),
      ),
      ),
    );
  }
}

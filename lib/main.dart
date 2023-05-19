import 'package:childern_health_care/block_obeserver.dart';
import 'package:childern_health_care/shared/components/constants.dart';
import 'package:childern_health_care/shared/cuibt/cubit.dart';
import 'package:childern_health_care/shared/cuibt/states.dart';
import 'package:childern_health_care/shared/network/local/cache_helper.dart';
import 'package:childern_health_care/shared/network/remote/dio_helper.dart';
import 'package:childern_health_care/shared/styles/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'modules/childern_app/home_screan/home_screan.dart';
import 'modules/childern_app/login/login_screan.dart';
import 'modules/childern_app/welcom/welcom_screan.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer=MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  await Firebase.initializeApp();
  uid=CacheHelper.getData(key: 'uId');
  var welcome=CacheHelper.getData(key: 'welcome');
   bool? isDark=CacheHelper.getData(key: 'isDark');
  print(uid);
  print(isDark);
  Widget widget;
  if(welcome !=null) {
    if (uid == null)
      widget = Login_Screan();
    else
      widget = HomePage_Screan();
  }else
    widget = Welcome_Screan();

  runApp( MyApp(
    startWidget: widget,
      isDark:isDark,
  ));
}
class MyApp extends StatelessWidget {
  final Widget startWidget;
   final bool? isDark;
  const MyApp({
    required this.startWidget,
       this.isDark,
  });
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create:(BuildContext context)=>ChildernCubit() ..getUserData()
        ..getHomeData()..changeAppMode(fromShared:isDark ),
      child:BlocConsumer<ChildernCubit,ChildernStates>(
        listener: (context,state){},
        builder: (context,state){
          return MaterialApp(
            theme:lighttheme,
            darkTheme: darktheme,
            themeMode: ChildernCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
            home:  startWidget,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );

  }
}



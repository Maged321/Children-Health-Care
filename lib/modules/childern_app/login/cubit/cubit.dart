


import 'package:childern_health_care/modules/childern_app/login/cubit/states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class ChildernLoginCubit extends Cubit<ChildernLoginState>
{
  ChildernLoginCubit() : super(ChildernLoginIntialState());

  static ChildernLoginCubit get(context) =>BlocProvider.of(context);



  void userLogin ({
    required String email,
    required String password ,
})
  {
    emit(ChildernLoginLoadingState());
    FirebaseAuth.instance.
    signInWithEmailAndPassword(
        email: email,
        password: password,
    ).then((value) {
    emit(ChildernLoginSuccesState(value.user!.uid));
    }).catchError((error){
      emit(ChildernLoginErrorState(error.toString()));
    });
  }

  IconData sufix = Icons.visibility_outlined;
  bool isPassword = true ;
  void changPasswordVisibility()
  {
    isPassword = !isPassword;

   sufix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ;

    emit(ChildernChangePasswordVisibilityState());
  }

}
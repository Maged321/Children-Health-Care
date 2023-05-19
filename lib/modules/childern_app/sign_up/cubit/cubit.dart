


import 'package:childern_health_care/modules/childern_app/sign_up/cubit/states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/register_model.dart';



class ChildernRegisterCubit extends Cubit<ChildernRegisterState>
{
  ChildernRegisterCubit() : super(ChildernRegisterIntialState());

  static ChildernRegisterCubit get(context) =>BlocProvider.of(context);




  void userRegister ({
    required String name,
    required String email,
    required String password ,
    required String phone,

  })
  {
    emit(ChildernRegisterLoadingState());
  FirebaseAuth.instance.
  createUserWithEmailAndPassword(
      email: email,
      password: password,
  ).then((value) {
     print(value.user);
     print(value.user!.uid);
     creatUser(
         name: name,
         email: email,
         phone: phone,
         uId: value.user!.uid,
     );
    }).catchError((error){
      print(error.toString());
      emit(ChildernRegisterErrorState(error));
    });
  }

  void creatUser({
    required String name,
    required String email,
    required String phone,
    required String uId,

  }){

    UserModel model=UserModel(
      name:name,
      phone: phone,
      email: email,
      uId: uId,
      isEmailVerified: false,
    );
    FirebaseFirestore.instance
        .collection('users').doc(uId)
        .set(model.toMap())
        .then((value) {
          emit(ChildernCreatUserSuccesState());
    }).catchError((error){
      print(error.toString());
      emit(ChildernCreatUserErrorState(error));

    });
  }

  IconData sufix = Icons.visibility_outlined;
  bool isPassword = true ;
  void changPasswordVisibility()
  {
    isPassword = !isPassword;

   sufix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ;

    emit(ChildernRegisterChangePasswordVisibilityState());
  }

}
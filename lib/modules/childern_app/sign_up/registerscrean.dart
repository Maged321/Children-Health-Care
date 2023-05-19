
import 'package:childern_health_care/modules/childern_app/sign_up/cubit/cubit.dart';
import 'package:childern_health_care/modules/childern_app/sign_up/cubit/states.dart';
import 'package:childern_health_care/shared/styles/colores.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/components/components.dart';
import '../home_screan/home_screan.dart';




class ChildernRigsterScean extends StatelessWidget {

  GlobalKey<FormState> _formkey =GlobalKey<FormState>();

  var nameController=TextEditingController();
  var emileController=TextEditingController();
  var passwordController=TextEditingController();
  var phoneController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(BuildContext context)=>ChildernRegisterCubit(),
      child: BlocConsumer<ChildernRegisterCubit,ChildernRegisterState>(
        listener: (context,state)
         {
          if (state is ChildernCreatUserSuccesState)
          {
            navigateAndFinish(context,HomePage_Screan());
           }
          //else {
          //   showToast(
          //       txt: state.toString(),
          //       state: ToastState.ERROR);
          // }
         },
        builder: (context,state){
          return Scaffold(
              appBar: AppBar(),
              body:SingleChildScrollView(
                child: Padding(
                  padding:MediaQuery.of(context).systemGestureInsets*0.8,
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage('assets/images/logo.png'),
                          width: MediaQuery.of(context).size.width*0.18,
                          height: MediaQuery.of(context).size.height*0.18,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Register'.toUpperCase(),
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.height*0.032,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.025,
                        ),
                        textFromFeild(
                          type: TextInputType.text,
                          controller: nameController,
                          validator: (String? value){
                            if(value == null || value.isEmpty){
                              return 'Please enter Your Name';
                            }
                            return null;
                          },
                          hinttext: 'Enter Your Name',
                          prefix:Icons.person,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.025,
                        ),
                        textFromFeild(
                          type: TextInputType.text,
                          controller: emileController,
                          validator: (String? value){
                            if(value == null || value.isEmpty){
                              return 'Please enter Your Emile Address';
                            }
                            return null;
                          },
                          hinttext: 'Enter Your Emile',
                          prefix:Icons.email_outlined,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.025,
                        ),
                        textFromFeild(
                          type: TextInputType.text,
                          suffix: ChildernRegisterCubit.get(context).sufix,
                          controller: passwordController,
                          onSubmit: (value)
                          {

                          },
                          suffixpress:()
                          {
                            ChildernRegisterCubit.get(context).changPasswordVisibility();
                          },
                          isPassword:ChildernRegisterCubit.get(context).isPassword,
                          validator: (String? value) {
                            if(value == null || value.isEmpty){
                              return 'Please enter your password ';
                            }
                            return null;
                          },
                          hinttext: 'Enter Your Password',
                          prefix:Icons.lock_open_outlined,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.025,
                        ),
                        textFromFeild(
                          type: TextInputType.text,
                          controller: phoneController,
                          validator: (String? value){
                            if(value == null || value.isEmpty){
                              return 'Please enter Your Phone Number';
                            }
                            return null;
                          },
                          hinttext: 'Enter Your Phone Number',
                          prefix:Icons.phone,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.06,
                        ),
                        ConditionalBuilder(
                          condition:state is! ChildernRegisterLoadingState ,
                          builder:(context) => Container(
                            width:double.infinity,
                            height: 47,
                            child: MaterialButton(
                              onPressed: (){
                                if (_formkey.currentState!.validate())
                                {
                                  ChildernRegisterCubit.get(context).userRegister(
                                    name: nameController.text,
                                    email:emileController.text,
                                    password: passwordController.text,
                                    phone: phoneController.text,
                                  );
                                }
                              },
                              child: Text(
                                'register'.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: defultColor,
                            ),
                          ),
                          fallback: (context) => Center(child: CircularProgressIndicator()),
                        ),
                      ],
                    ),
                  ),
                ),
              )
          );
        },
      )
    );
  }
}


import 'package:childern_health_care/modules/childern_app/login/cubit/cubit.dart';
import 'package:childern_health_care/modules/childern_app/login/cubit/states.dart';
import 'package:childern_health_care/modules/childern_app/sign_up/registerscrean.dart';
import 'package:childern_health_care/shared/components/components.dart';
import 'package:childern_health_care/shared/styles/colores.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/network/local/cache_helper.dart';
import '../home_screan/home_screan.dart';
import '../welcom/welcom_screan.dart';


class Login_Screan extends StatelessWidget {

  GlobalKey<FormState> _formkey =GlobalKey<FormState>();
  var emileController=TextEditingController();
  var passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>ChildernLoginCubit(),
      child: BlocConsumer<ChildernLoginCubit,ChildernLoginState>(
        listener: (context,state)
        {
          if(state is ChildernLoginErrorState){
            showToast(
                txt:state.error,
                state: ToastState.ERROR,
            );
          }
          if(state is ChildernLoginSuccesState){
            CacheHelper.saveData(
                key: 'uId',
                value: state.uId,
            ).then((value) {
              navigateAndFinish(context, HomePage_Screan());
            });
          }
        },
        builder: (context,state){
          return Scaffold(
              appBar: AppBar(
                title: InkWell(
                  onTap: () {
                    navigateTo(
                      context,
                      Welcome_Screan(),
                    );
                  },
                  child: Icon(Icons.arrow_back),
                ),
              ),
              body:SingleChildScrollView(
                child: Padding(
                  padding: MediaQuery.of(context).systemGestureInsets*0.5,
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage('assets/images/logo.png'),
                          width: MediaQuery.of(context).size.width*0.21,
                          height: MediaQuery.of(context).size.height*0.21,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'LOGIN'.toUpperCase(),
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.height*0.03,
                                fontWeight: FontWeight.bold,
                               // color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.03,
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
                          height: MediaQuery.of(context).size.height*0.03,
                        ),
                        textFromFeild(
                          type: TextInputType.text,
                          suffix: ChildernLoginCubit.get(context).sufix,
                          controller: passwordController,
                          suffixpress:()
                          {
                            ChildernLoginCubit.get(context).changPasswordVisibility();
                          },
                          isPassword:ChildernLoginCubit.get(context).isPassword,
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
                          height:MediaQuery.of(context).size.height*0.045,
                        ),
                        ConditionalBuilder(
                          condition:state is! ChildernLoginLoadingState ,
                          builder:(context) => Container(
                            width:double.infinity,
                            height:MediaQuery.of(context).size.height*0.07,
                            child: MaterialButton(
                              onPressed: (){
                                if (_formkey.currentState!.validate())
                                {
                                  ChildernLoginCubit.get(context).userLogin(
                                      email:emileController.text,
                                      password: passwordController.text);
                                }
                              },
                              child: Text(
                                'login'.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: defultColor,
                            ),
                          ),
                          fallback: (context) => Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(
                          height:MediaQuery.of(context).size.height*0.035,
                        ),
                        Row(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Don\'t have an acount??'),
                            defulteTextButton(
                              onPressed: (){
                                navigateTo(context,ChildernRigsterScean(),);
                              },
                              text:'Rigster Now',

                            ),
                          ],
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


import 'package:childern_health_care/models/homemodel.dart';
import 'package:childern_health_care/shared/styles/colores.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../modules/childern_app/categories/sections_screans/subsection_screan.dart';
import '../../modules/childern_app/home_screan/home_screan.dart';
import 'constants.dart';


Widget defulteTextButton(
{
  required void Function()? onPressed,
  required String text,
})=>TextButton(
     onPressed:onPressed ,
     child:Text(text.toUpperCase(),
       style: TextStyle(
          color: defultColor
       ),
     ),

);

 Widget defulteButton({
    double width= double.infinity,
    Color background=defultColor,
    bool UpperCase=true,
    required Function()? Onpress,
    required String text,
})=> Container(
    width: width,
    height: 47,
  child: MaterialButton(
    onPressed: (){
      Onpress;
    },
    child: Text(
      UpperCase?text.toUpperCase():text,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  ),
   decoration: BoxDecoration(
     borderRadius: BorderRadius.circular(5),
     color: background,
   ),
);


 Widget textFromFeild(
      {
        required TextInputType type ,
        required TextEditingController controller,
        Function(String)? onSubmit,
        Function(String)? onChange,
        required  String? Function(String?)? validator,
         String? label,
        required String hinttext,
        required IconData? prefix,
        IconData? suffix,
        Function()? suffixpress,
        Function()? ontap,
        bool isPassword=false,
      }
      )=>
     TextFormField(
      keyboardType:type,
       controller:controller,
       onFieldSubmitted:onSubmit,
       onChanged:onChange,
       validator: validator,
       onTap:ontap ,
       obscureText:isPassword,
       decoration: new InputDecoration(
         labelText: label,
         hintText: hinttext,
         prefixIcon:Icon(
            prefix,
           color: defultColor,
           size: 25.0,
         ),
         suffixIcon:suffix !=null?IconButton(
                 onPressed:suffixpress,
                 icon:Icon(
                   suffix,
                   color: defultColor,
                 ),
             ) : null ,
         border: UnderlineInputBorder(),
         enabledBorder: UnderlineInputBorder(),

   ),
 );




 Widget myDivider(
{
  required Color? color
}
     )=>Container(
   height: .90,
   width: double.infinity,
   color: color,

 );

 void navigateTo(context,widget)=>Navigator.push(
   context,
    MaterialPageRoute(
     builder:(context)=>widget,
   ),
 );
void navigateAndFinish(context,widget)=>Navigator.pushAndRemoveUntil
  (
  context,
   MaterialPageRoute(
    builder:(context)=>widget,
  ),
    (Route<dynamic>route)=>false,
);
void showToast({
   required String txt,
      required ToastState state,
 })=>Fluttertoast.showToast(
      msg:txt,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor:chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );
enum ToastState{SUCCESS,ERROR,WARNING}

 Color chooseToastColor(ToastState state){
  Color color;
  switch(state){
    case ToastState.SUCCESS:
      color=Colors.green;
      break;
    case ToastState.ERROR:
      color=Colors.red;
      break;
    case ToastState.WARNING:
      color=Colors.amber;
      break;
  }
  return color;
 }

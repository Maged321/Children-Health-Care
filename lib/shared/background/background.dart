
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        // Positioned(
        //   top: 0,
        //   right: 0,
        //   child: Image.network(
        //     "assets/images/img3.jpg",
        //     width: size.width,
        //   ),
        // ),
        // Positioned(
        //   bottom: 0,
        //   left: 0,
        //   child: Image.asset(
        //       "assets/images/img2.jpg",
       //       width: size.width
         // ),
       // ),
        // Positioned(
        //   bottom: 0,
        //   right: 0,
        //   child: Image.asset(
        //       "assets/images/img3.jpg",
        //       width: size.width
        //   ),
        // ),
        // Positioned(
        //   top: 0,
        //   right: 0,
        //   child: Image.asset(
        //       "assets/images/img2.jpg",
        //       width: size.width
        //   ),
        // ),
        child
      ],
    );
  }
}
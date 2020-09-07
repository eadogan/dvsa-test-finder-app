import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/main_top.png",
              width: size.width * 0.3,
            ),
          ),
          Positioned(
            top: 50,
            right: 50,
            child: Image.asset(
              "assets/images/signup_dot.png",
              width: size.width * 0.10,
            ),
          ),
          Positioned(
            top: 100,
            left: 250,
            child: Image.asset(
              "assets/images/main_dot.png",
              width: size.width * 0.25,
            ),
          ),
          Positioned(
            top: 250,
            left: 0,
            child: Image.asset(
              "assets/images/main_dot.png",
              width: size.width * 0.08,
            ),
          ),
          Positioned(
            bottom: 150,
            left: 150,
            child: Image.asset(
              "assets/images/signup_dot.png",
              width: size.width * 0.10,
            ),
          ),
          Positioned(
            bottom: 5,
            right: 50,
            child: Image.asset(
              "assets/images/signup_dot.png",
              width: size.width * 0.4,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              "assets/images/main_bottom.png",
              width: size.width * 0.2,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              "assets/images/signup_bottom.png",
              width: size.width * 0.2,
            ),
          ),
          child,
        ],
      ),
    );
  }
}

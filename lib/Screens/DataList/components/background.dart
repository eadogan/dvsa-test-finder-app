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
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/main_top.png",
              width: size.width * 0.35,
            ),
          ),
          Positioned(
            top: 50,
            right: 50,
            child: Image.asset(
              "assets/images/main_dot.png",
              width: size.width * 0.2,
            ),
          ),
          Positioned(
            top: 50,
            left: 150,
            child: Image.asset(
              "assets/images/main_dot.png",
              width: size.width * 0.05,
            ),
          ),
          Positioned(
            bottom: 50,
            left: 50,
            child: Image.asset(
              "assets/images/signup_dot.png",
              width: size.width * 0.15,
            ),
          ),
          Positioned(
            bottom: 150,
            left: 150,
            child: Image.asset(
              "assets/images/signup_dot.png",
              width: size.width * 0.05,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              "assets/images/login_bottom.png",
              width: size.width * 0.4,
            ),
          ),
          child,
        ],
      ),
    );
  }
}

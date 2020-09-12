import 'package:dvsa_app/Screens/Login/components/background.dart';
import 'package:dvsa_app/components/rounded_button.dart';
import 'package:dvsa_app/components/rounded_input_field.dart';
import 'package:dvsa_app/constants.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "LOGIN",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              // SvgPicture.asset(
              //   "assets/icons/login.svg",
              //   height: size.height * 0.35,
              // ),

              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                // icon: Icon(Icons.art_track),
                labelText: "Driving Licence Number",
                hintText: "eg MORGA54534S2",
                onChanged: (value) {},
              ),
              RoundedInputField(
                // icon: Icon(Icons.art_track) ,
                labelText: "Reference Number",
                hintText: "eg 653445",
                onChanged: (value) {},
              ),
              RoundedButton(
                text: "LOGIN",
                press: () {},
              ),
              SizedBox(height: size.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Don't have a test yet ? ",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                  GestureDetector(
                    // onTap: press,
                    child: Text(
                      "Book here",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

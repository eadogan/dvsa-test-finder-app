import 'package:dvsa_app/Screens/DataList/data_screen.dart';
import 'package:dvsa_app/components/rounded_input_field.dart';
import 'package:flutter/material.dart';
import 'package:dvsa_app/Screens/UserDetails/components/background.dart';
import 'package:dvsa_app/components/rounded_button.dart';
import 'package:dvsa_app/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    String _buildDrivingLicenceNumber;
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "WELCOME TO DVSA TEST FINDER",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: size.height * 0.05),
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
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "Find me a test",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      // return LoginScreen();
                      return DataScreen();
                    },
                  ),
                );
              },
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
                  onTap: () {
                    const url = 'https://driverpracticaltest.dvsa.gov.uk/application?_ga=2.190689443.969315605.1599346425-1179096359.1597325102';
                    launchURL(url);
                  },
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
    );
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }
}

import 'package:dvsa_app/Screens/DataList/data_screen.dart';
import 'package:dvsa_app/Screens/UserDetails/components/background.dart';
import 'package:dvsa_app/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constants.dart';

class UserDetailsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    String _buildDrivingLicenceNumber;
    Size size = MediaQuery.of(context).size;
    TextEditingController licenceNumberController = new TextEditingController();
    TextEditingController referenceNumberController =
        new TextEditingController();
    // This size provide us total height and width of our screen
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "WELCOME TO DVSA TEST FINDER",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(height: size.height * 0.05),
              TextFormField(
                controller: licenceNumberController,
                decoration: new InputDecoration(
                  labelText: "Licence Number",
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
                ),
                validator: (val) {
                  if (val.length == 0) {
                    return "Licence number cannot be empty";
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.emailAddress,
                style: new TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
              SizedBox(height: size.height * 0.05),
              TextFormField(
                controller: referenceNumberController,
                decoration: new InputDecoration(
                  labelText: "Reference Number",
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
                  //fillColor: Colors.green
                ),
                validator: (val) {
                  if (val.length == 0) {
                    return "Reference number cannot be empty";
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.emailAddress,
                style: new TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
              SizedBox(height: size.height * 0.05),
              RoundedButton(
                text: "Find me a test",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          new DataScreen(licenceNum: licenceNumberController.text,referenceNum: referenceNumberController.text,),
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
                      const url =
                          'https://driverpracticaltest.dvsa.gov.uk/application?_ga=2.190689443.969315605.1599346425-1179096359.1597325102';
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

// Future<http.Response> postRequestForSelectedData() async {
//
//   Map data = {
//     "licenceNumber": _center,
//     "referenceNumber": _date,
//   };
//
//   //encode Map to JSON
//   // var body = json.encode(data);
//   var uri = Uri.https('http://localhost:8080/fndr-mng-svc/exams', '/{licenceNumber}/{referenceNumber}/list', data);
//   var response = await http.get(
//       url,
//       headers: {"Content-Type": "application/json"},
//       data
//   );
//
//
//
//   print("burda miiiiiii");
//   print("${response.statusCode}");
//   print("${response.body}");
//   print(response);
//   return response;
// }
}

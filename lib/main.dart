import 'package:dvsa_app/constants.dart';
import 'package:flutter/material.dart';
import 'Screens/UserDetails/user_details_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DVSA Cancellation',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white
      ),
      home: UserDetailsScreen(),
    );
  }
}

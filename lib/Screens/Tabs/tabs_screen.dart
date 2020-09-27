import 'package:dvsa_app/Screens/DataList/data_screen.dart';
import 'package:dvsa_app/Screens/Profile/profile_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  final String licenceNum;
  final String referenceNum;

  const TabsScreen({Key key, this.licenceNum, this.referenceNum}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _currentIndex = 0;
  String licenceNumber;
  String referenceNumber;

  void initState() {
    super.initState();
    this.getData();

  }

  Future<String> getData() async {
    licenceNumber = widget.licenceNum;
    referenceNumber = widget.referenceNum;
  }

  Widget getPage(int index) {
    if (index == 0) {
      return DataScreen(licenceNum:licenceNumber, referenceNum: referenceNumber,);
    }
    if (index == 1) {
      return ProfileScreen(licenceNum:licenceNumber, referenceNum: referenceNumber);
    }
  }


  void onTappedBar(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      body: getPage(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text("List")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text("Profile")
          )
        ],
      ),
    );
  }
}

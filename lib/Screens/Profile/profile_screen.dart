import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dvsa_app/Screens/DataList/components/background.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatefulWidget {
  final String licenceNum;
  final String referenceNum;

  const ProfileScreen({Key key, this.licenceNum, this.referenceNum})
      : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List dataList;
  var isLoading = false;


  void initState() {
    super.initState();
    this.getJsonData();
    isLoading = true;
  }

  Future<String> getJsonData() async {
    final response = await http.get(
        Uri.encodeFull("http://10.0.2.2:8576/fndr-mng-svc/exams/profile/licenceNumber/referenceNumber"),
        headers: {"Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"}
    );
    setState(() {
      if (response.statusCode == 200) {
        isLoading =  false;
        var convertJsonToData = json.decode(response.body);
        dataList = convertJsonToData['data'];
      } else {
        throw Exception('Failed to load data');
      }
    });
    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text("Profile"),
            automaticallyImplyLeading: false,
          ),
          body: isLoading ?
            Center(child: CircularProgressIndicator()) :
            ListView(
              children: ListTile.divideTiles(
                      context: context,
                      tiles: [
                        ListTile(
                          title: Text('Driver Licence Number:\n' + widget.licenceNum),
                        ),
                        ListTile(
                          title:
                              Text('Booking Reference Number:\n' + widget.referenceNum),
                        ),
                        ListTile(
                          title: Text('Test Center:\n' + dataList[0]['center']),
                        ),
                        ListTile(
                          title: Text('Date and Time of Test:\n' + dataList[0]['slot'][0]),
                        ),
                        ListTile(
                          title: Text('Last Change Date and Time:\n'+ dataList[0]['change']),
                        ),
                      ],
                    ).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

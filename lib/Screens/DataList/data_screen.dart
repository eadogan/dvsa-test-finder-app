import 'package:flutter/material.dart';
import 'package:dvsa_app/Screens/DataList/components/background.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DataScreen extends StatefulWidget {
  final String value;

  const DataScreen({Key key, this.value}) : super(key: key);

  @override
  _DataScreenState createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  String url = "http://dummy.restapiexample.com/api/v1/employees";

  // String url = "http://localhost:8080/fndr-mng-svc/exams/${widget.value}/list";
  List dataList;
  var isLoading = false;
  var _center, _date;

  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async {
    final response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    setState(() {
      if (response.statusCode == 200) {
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text("Available Test Slot List"),
          ),
          body: isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: dataList == null ? 0 : dataList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return new Container(
                      child: new Center(
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            new Card(
                                child: new ListTile(
                                    title: new Text(
                                        dataList[index]['employee_name']),
                                    subtitle: new Text("Wood Green"),
                                    onTap: () {
                                      _showAlertDialog(context);
                                      _center =
                                          dataList[index]['employee_name'];
                                      _date = dataList[index]['employee_age'];
                                    },
                                    leading: GestureDetector(
                                      child: Container(
                                        width: 0,
                                        height: 48,
                                        alignment: Alignment.bottomCenter,
                                      ),
                                    ))),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }

  _showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Continue"),
      onPressed: () {
        postRequestForSelectedData();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Alert Dialog"),
      content: Text("Would you like to continue changing to your Test Date ?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<http.Response> postRequestForSelectedData() async {
    var url = 'http://localhost:8080/fndr-mng-svc/axams/change-slot';

    Map data = {
      "center": _center,
      "date": _date,
    };

    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: body);

    print("burda miiiiiii");
    print("${response.statusCode}");
    print("${response.body}");
    print(response);
    return response;
  }
}

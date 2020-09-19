import 'package:flutter/material.dart';
import 'package:dvsa_app/Screens/DataList/components/background.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DataScreen extends StatefulWidget {
  final String licenceNum;
  final String referenceNum;

  const DataScreen({Key key, this.licenceNum, this.referenceNum}) : super(key: key);

  @override
  _DataScreenState createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  List dataList;
  var isLoading = false;
  var _center, _date;
  bool _isVisible = true;
  bool visibilityTag = false;
  bool visibilityObs = false;

  void initState() {
    super.initState();
    this.getJsonData();
    isLoading = true;
  }

  Future<String> getJsonData() async {
    final response = await http.get(
        // Uri.encodeFull("http://localhost:8576/fndr-mng-svc/exams/${widget.licenceNum}/${widget.referenceNum}/list"),
        Uri.encodeFull("http://dummy.restapiexample.com/api/v1/employees"),
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
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: Text("Available Test Slot List"),
            ),
            body: isLoading ? Center(child: CircularProgressIndicator()) :
            ListView.builder(
                shrinkWrap: true,
                itemCount: dataList == null ? 0 : dataList.length,
                itemBuilder: (context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new ExpansionTile(
                      initiallyExpanded: false,
                        leading: Icon(Icons.view_list),
                        title: Column(
                          children: <Widget>[
                            new ListTile(
                                title: new Text(dataList[index]['center']),
                                subtitle: new Text("Test Center"),
                                onTap: () {
                                },
                                leading: GestureDetector(
                                  child: Container(
                                    width: 0,
                                    height: 50,
                                    alignment: Alignment.bottomCenter,
                                  ),
                                )
                            ),
                          ],
                        ),
                        children: <Widget>[
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                  ListView.builder(
                                    physics: ClampingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: dataList[index]['slot'].length,
                                    itemBuilder: (context, int i) {
                                      return Card(
                                        shape: StadiumBorder(
                                          side: BorderSide(
                                            color: Colors.black,
                                            width: 0.5,
                                          ),
                                        ),
                                        child: ListTile(
                                          title: new Text(dataList[index]['slot'][i]),
                                          onTap: () {
                                            _showAlertDialog(context);
                                            _center = dataList[index]['center'];
                                            _date = dataList[index]['slot'][i];
                                          },
                                          leading: GestureDetector(
                                            child: Container(
                                              width: 0,
                                              height: 50,
                                              alignment: Alignment.bottomCenter,
                                            ),
                                          )
                                        ),
                                      );
                                    }
                                  ),
                                ]
                          ),
                        ],
                      ),
                    ],
                  );
                })
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
        print(_center);
        print(_date);

        // postRequestForSelectedData();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Are you sure"),
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
    var url = 'http://10.0.2.2:8576/fndr-mng-svc/exams/change-slot';

    Map data = {
      "center": _center,
      "date": _date,
    };

    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: body);

    print("${response.statusCode}");
    print("${response.body}");
    print(response);
    return response;
  }
}
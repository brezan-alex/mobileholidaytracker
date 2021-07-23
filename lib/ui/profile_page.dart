import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:login/dbStrings.dart';
//import 'package:login/server.dart';
import 'package:login/utils/fetchHolidayJson.dart';
import 'package:http/http.dart' as http;

import 'my_drawer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key key,
    this.username = "Error",
  }) : super(key: key);
  final String username;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<List<Pull>> pullDates(String id) async {
    final pulled =
        await http.post(server_url + "fetch.php", body: {"employee_id": id});
    print(pullFromJson(pulled.body));
    return pullFromJson(pulled.body);
  }

  String _username = "Error";
  Future _userName() async {
    var res = await http.post(server_url + "fetch.php",
        body: {"employee_id": widget.username});
    var resData = json.decode(res.body);
    print(resData[0]['employee_id']);
    setState(() {
      _username = resData[0]['first_name'];
    });
    return "success";
  }
  @override
  void initState() {
    super.initState();
    _userName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(
        username: _username,
      ),
      appBar: AppBar(
        title: Text("Here are your leaves $_username"),
      ),
      body: Container(
        child: FutureBuilder(
            future: pullDates(widget.username),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  padding: EdgeInsets.only(bottom: kFloatingActionButtonMargin + 48),
                  itemCount: snapshot.data.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    Pull pull = snapshot.data[index];
                    return Container(
                      padding: EdgeInsets.fromLTRB(35, 40, 35, 0),
                      height: 184,
                      width: double.maxFinite,
                      child: Card(
                        elevation: 15,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                '${pull.holidayType}',
                                style: TextStyle(fontSize: 20),
                              ),
                              subtitle: Text(
                                'From ${_monthName(pull.startDate.month)} ${pull.startDate.day}'
                                ' to'
                                ' ${_monthName(pull.endDate.month)} ${pull.endDate.day}',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            ButtonBar(
                              children: [
                                FlatButton(
                                  child: Text("DELETE"),
                                  onPressed: () async{
                                    await http.post("$server_url/delete.php", body:{
                                      "holiday_id" : pull.holidayId
                                    },);
                                    Navigator.pushReplacementNamed(context, '/profile',
                                        arguments: _username);
                                  },
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
              return Center(child: CircularProgressIndicator());
            }),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/holiday', arguments: widget.username);},
        icon: Icon(Icons.calendar_today),
        label: Text("New"),
        backgroundColor: Colors.red,
      ),
    );
  }

  String _monthName(int month) {
    switch (month) {
      case 1:
        return "January";
        break;
      case 2:
        return "February";
        break;
      case 3:
        return "March";
        break;
      case 4:
        return "April";
        break;
      case 5:
        return "May";
        break;
      case 6:
        return "June";
        break;
      case 7:
        return "July";
        break;
      case 8:
        return "August";
        break;
      case 9:
        return "September";
        break;
      case 10:
        return "October";
        break;
      case 11:
        return "November";
        break;
      case 12:
        return "December";
        break;
      default:
        return null;
        break;
    }
  }
}

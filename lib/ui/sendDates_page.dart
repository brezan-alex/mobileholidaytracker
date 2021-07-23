import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:login/dbStrings.dart';
import 'package:login/ui/my_drawer.dart';

class DatePage extends StatefulWidget {
  const DatePage({
    Key key,
    this.usernameId = "99",
  }) : super(key: key);
  final String usernameId;

  @override
  _DatePageState createState() => _DatePageState();
}

class _DatePageState extends State<DatePage> {
  String selectedName;
  List data = List();
  Future _dropdownHolidays() async {
    var res = await http.get(server_url + "holidays.php", headers: {});
    var jsonBody = res.body;
    var jsonData = json.decode(jsonBody);

    setState(() {
      data = jsonData;
    });
    //print(jsonData);
    return "success";
  }

  DateTimeRange picked = DateTimeRange(
      start: DateTime.now(), end: DateTime.now().add(Duration(days: 6)));

  @override
  void initState() {
    super.initState();
    _dropdownHolidays();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // drawer: MyDrawer(
        //   username: username,
        // ),
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context)),
          title: Text("Select"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Text("Type of leave: ", style: TextStyle(fontSize: 15)),
                    Container(
                      width: 150,
                      height: 15,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                            isExpanded: true,
                            value: selectedName,
                            hint: Text(
                              "Select..",
                              style: TextStyle(fontSize: 15),
                            ),
                            items: data.map((list) {
                              return DropdownMenuItem(
                                child: Text(list['holiday_type'],
                                    style: TextStyle(fontSize: 15)),
                                value: list['holiday_type_id'].toString(),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedName = value;
                              });
                            }),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('Leave period between '
                        '${picked.start.day}.${picked.start.month} '
                        'and ${picked.end.day}.${picked.end.month}'),
                    MaterialButton(
                      onPressed: () async {
                        DateTimeRange neu = await showDateRangePicker(
                          saveText: "DONE",
                          initialDateRange: DateTimeRange(
                              start: DateTime.now(),
                              end: DateTime.now().add(Duration(days: 6))),
                          context: context,
                          firstDate: //calendar picker range
                              DateTime(DateTime.now().year),
                          lastDate: DateTime(DateTime.now().year + 1),
                        );
                        if (neu != null)
                          setState(() {
                            picked = neu;
                          });
                      },
                      child: Text('Change ..'),
                    )
                  ],
                ),
                MaterialButton(
                  color: Colors.lightGreen,
                  child: Text("Save"),
                  onPressed: () async{
                    print("$picked, $selectedName, ${widget.usernameId}");
                    await sendDate(picked, selectedName, widget.usernameId);
                    Navigator.pushReplacementNamed(context, '/profile',
                        arguments: widget.usernameId);
                  },
                ),
              ],
            ),
          ),
        ));
  }

  Future sendDate(
      DateTimeRange picked, String holidayType, String usernameId) async {
    DateTime today = picked.start;
    int workdays = 0;
    for (int i = 0; i <= picked.duration.inDays; i++) {
      //counting nr of work days

      if (today.weekday != DateTime.saturday &&
          today.weekday != DateTime.sunday) workdays++;
      today = today.add(Duration(days: 1));
      //print("$workdays $today");
    }

    final res = await http.post(server_url + "sendDates.php", body: {
      "employee_id": usernameId,
      "nr_of_holidays": workdays.toString(),
      "holiday_type_id": holidayType,
      "start_date": picked.start.toString(),
      "end_date": picked.end.toString(),
    });
    final String resString = res.body;
    return jsonDecode(resString);
  }
}



import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
    this.username = "Failure",
  }) : super(key: key);
  final String username;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: <Color>[Colors.red, Colors.redAccent]),
            ),
            child: Container(
              child: Column(
                children: <Widget>[
                  Material(
                    //borderRadius: BorderRadius.all(Radius.circular(90.0)),
                    child: Padding(
                      padding: EdgeInsets.all(4.5),
                      child: Image.asset(
                        'assets/img/login_logo.png',
                        width: 79,
                        height: 79,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "${this.username}",
                      style: TextStyle(color: Colors.white, fontSize: 21.5),
                    ),
                  )
                ],
              ),
            ),
          ),
          DrawerRow(Icons.person, "Profile",
                  () => {Navigator.popAndPushNamed(context, '/profile', arguments: this.username)}),
          // DrawerRow(
          //           //     Icons.today,
          //           //     "Holiday leave",
          //           //         () => {
          //           //       Navigator.popAndPushNamed(context, '/holiday', arguments: this.username),
          //           //     }),
          DrawerRow(Icons.power_settings_new, 'Logout',
                  () => {Navigator.pushReplacementNamed(context, '/login')}),
        ],
      ),
    );
  }
}

class DrawerRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;

  DrawerRow(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration:
        BoxDecoration(border: Border(top: BorderSide(color: Colors.grey))),
        child: InkWell(
          splashColor: Colors.greenAccent,
          onTap: onTap,
          child: Container(
            height: 50,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(icon),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          text,
                          style: TextStyle(fontSize: 16.0),
                        ),
                      )
                    ],
                  ),
                  Icon(Icons.arrow_right)
                ]),
          ),
        ),
      ),
    );
  }
}
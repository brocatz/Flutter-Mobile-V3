import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      padding: EdgeInsets.only(
        top: 20,
      ),
      decoration: BoxDecoration(color: Color(0xFF1d2d44)),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 250,
                  child: DrawerHeader(
                      padding: EdgeInsets.fromLTRB(30.0, 16.0, 16.0, 8.0),
                      decoration: BoxDecoration(color: Colors.transparent),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: CircleAvatar(
                              radius: 50,
                              // backgroundImage:
                              //     AssetImage('assets/images/Me.jpg'),
                            ),
                          ),
                          SizedBox(height: 10),
                          Flexible(
                            child: Text(
                              'First' + ' Name',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
          Expanded(
              child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(
                  Icons.account_circle_rounded,
                  color: Colors.white,
                ),
                title: Text(
                  'Profile',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.fastfood,
                  color: Colors.white,
                ),
                title: Text(
                  'Orders',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                title: Text(
                  'Setting',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          )),
          Container(
            alignment: FractionalOffset.bottomCenter,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Divider(
                    thickness: 2,
                    color: const Color.fromARGB(171, 158, 158, 158),
                  ),
                ),
                ListTile(
                  onTap: () {
                    // FirebaseAuth.instance.signOut();
                    Navigator.popUntil(context, ModalRoute.withName('/'));
                  },
                  leading: Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Log Out',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}

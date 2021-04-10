import 'package:flutter/material.dart';

import 'components/dashboard/Dashboard.dart';
import 'components/mytracks/MyTracks.dart';
import 'components/others/Others.dart';

import 'package:envirocar_flutter/pages/loginsignup/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  bool authenticationState = false;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  String currUser = "";
  List<Widget> pages = [
    Dashboard(),
    MyTracks(),
    Others(),
  ];

  PageController pageController;

  void initState() {
    getCurrUserValuesSF();
    pageController = new PageController(initialPage: _selectedIndex);
    super.initState();
  }

  getCurrUserValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String

    String stringValue = "";

    stringValue = await prefs.getString('X-User');
    setState(() {
      if (stringValue == null)
        currUser = "";
      else
        currUser = stringValue;
      print("state set: " + currUser);
    });

    return true;
  }

  Future<bool> LogOut() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      // print(sharedPreferences.getString('X-User'));
      sharedPreferences.remove('X-User');
      sharedPreferences.remove('X-Token');
      currUser = "";

      // print(sharedPreferences.getString('X-User'));
    });
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Logout Successful')));

    return true;
  }

  void _onBottomNavNavigate(int index) {
    setState(() {
      _selectedIndex = index;
    });
    this.pageController.animateToPage(
          _selectedIndex,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Column(
          children: [
            Image.asset(
              'assets/images/img_envirocar_logo_white.png',
              fit: BoxFit.scaleDown,
              height: 3 * kToolbarHeight / 5,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              currUser,
              style: TextStyle(color: Colors.white,fontSize: 15),
            )
          ],
        )),
        shadowColor: Colors.transparent,
        leading: Container(),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String _selection) {
              switch (_selection) {
                case "Login/Register":
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                  break;
                case "Log out":
                  LogOut();

                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => LoginPage()),
                  // );
                  break;
                default:
              }
            },
            itemBuilder: (BuildContext context) {
              String popUpMenuItems = "Login/Register";
              print("returneed:");
              print(currUser);
              setState(() {
                if (currUser != "") {
                  popUpMenuItems = "Log out";
                } else {
                  popUpMenuItems = "Login/Register";
                }
              });

              return {popUpMenuItems}.map((choice) {
                return PopupMenuItem(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      // body: pages[_selectedIndex],
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.speed),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alt_route),
            label: "My Tracks",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: "Others",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onBottomNavNavigate,
      ),
    );
  }
}

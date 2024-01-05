import 'package:bar_council_main2/pages/annual_amt.dart';
import 'package:bar_council_main2/pages/homepage.dart';
import 'package:bar_council_main2/pages/you_profile.dart';
import 'package:flutter/material.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({Key? key}) : super(key: key);

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int myIndex = 0;

  void _onTappedNav(int index) {
    setState(() {
      myIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(),
          ),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Annualamt(),
          ),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Youprofile(),
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.blue,
      selectedFontSize: 15,
      currentIndex: myIndex,
      onTap: _onTappedNav,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.white, size: 30),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Container(
            width: 30,
            height: 30,
            child: Image(
              image: AssetImage('assets/images/crown.png'),
            ),
          ),
          label: 'Annual Fee',
          backgroundColor: Colors.black,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle, color: Colors.white, size: 30),
          label: 'You',
          backgroundColor: Colors.black,
        ),
      ],
    );
  }
}

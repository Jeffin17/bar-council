//
//
// import 'package:flutter/material.dart';
//
// class MyBottomNavBar extends StatefulWidget {
//   const MyBottomNavBar({super.key});
//
//   @override
//   State<MyBottomNavBar> createState() => _MyBottomNavBarState();
// }
//
// class _MyBottomNavBarState extends State<MyBottomNavBar> {
//
//   int _currentIndexNav = 0;
//
//   void _onTappedNav(int index) {
//     setState(() {
//       _currentIndexNav = index;
//     });
//     switch (index) {
//       case 0:
//         Navigator.pushReplacementNamed(context, '/home');
//         break;
//       case 1:
//         Navigator.pushReplacementNamed(context, '/PastDelivery');
//         break;
//       case 2:
//         Navigator.pushReplacementNamed(context, '/ProfilePage');
//         break;
//     }
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       currentIndex: _currentIndexNav,
//       onTap: _onTappedNav,
//       // selectedItemColor: Colors.white70,
//       backgroundColor: Color.fromRGBO(56, 151, 233, 100),
//       iconSize: 25.0,
//       items: [
//         BottomNavigationBarItem(
//           icon: Icon(
//             Icons.home,
//             color: Colors.black,
//           ),
//           activeIcon: Icon(
//             Icons.home,
//             color: Colors.deepPurple,
//           ),
//           label: 'Home',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.delivery_dining, color: Colors.black),
//           activeIcon: Icon(
//             Icons.delivery_dining,
//             color: Colors.deepPurple,
//           ),
//           label: 'Past Delivery',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.account_circle_outlined, color: Colors.black),
//           activeIcon: Icon(
//             Icons.account_circle_outlined,
//             color: Colors.deepPurple,
//           ),
//           label: 'Profile',
//         ),
//       ],
//     );
//   }
// }

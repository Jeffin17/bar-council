
import 'package:flutter/material.dart';

import '../widgets/MyBottomNavBar_final.dart';

class Youprofile extends StatelessWidget{
  const Youprofile ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomNavBar(),
      body: Center(
        child: Text('Profile',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w800),),
      ),
    );
  }
}
import 'dart:convert';

import 'package:flutter/material.dart';

import '../utils/constant.dart';
import '../widgets/MyBottomNavBar_final.dart';
import 'homepage.dart';

class Annualamt extends StatefulWidget {
  const Annualamt({super.key});

  @override
  State<Annualamt> createState() => _AnnualamtState();
}

class _AnnualamtState extends State<Annualamt> {
  var datas;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: const MyBottomNavBar(),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            if (!FocusScope.of(context).hasPrimaryFocus) {
              FocusScope.of(context).unfocus();
            }
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      // color: Colors.teal,
                      height: height / 2.0,
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.menu,
                              size: 30,
                              color: Colors.white,
                            ))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(28, 120, 28, 0),
                      child: Container(
                        height: height / 4.0,
                        // width: width,
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(44, 44, 44, 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                      ),
                    ),
                    Positioned(
                      top: height / 4.8,
                      left: width / 7,
                      child: Center(
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.white,
                          backgroundImage: datas != null
                              ? MemoryImage(base64Decode(datas))
                              : const AssetImage(
                                  'assets/images/man.png',
                                ) as ImageProvider<Object>?,
                        ),
                      ),
                    ),
                    Positioned(
                        top: height / 4.8,
                        left: width / 2.59,
                        child: const Text(
                          'Sample Name',
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 18,
                              color: Colors.white),
                        )),
                    Positioned(
                        top: height / 4.0,
                        left: width / 2.59,
                        child: const Text(
                          'Annual Fee :',
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 18,
                              color: Colors.white),
                        )),
                    Positioned(
                        top: height / 3.4,
                        left: width / 2.59,
                        child: const Text(
                          'Reg No.',
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 18,
                              color: Colors.white),
                        )),
                  ],
                ),
                SizedBox(
                  height: height * 0.20,
                ),
                SizedBox(
                  height: 60,
                  width: height,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(button),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0))),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyHomePage(),
                          ));
                    },
                    child: const Text(
                      backbuttonhint,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

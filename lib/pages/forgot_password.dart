import 'package:bar_council_main2/utils/constant.dart';
import 'package:flutter/material.dart';

import '../widgets/main_fields.dart';
import 'login.dart';

class ForgotPwd extends StatefulWidget {
  const ForgotPwd({super.key});

  @override
  State<ForgotPwd> createState() => _ForgotPwdState();
}

class _ForgotPwdState extends State<ForgotPwd> {
  TextEditingController phone = TextEditingController();
  TextEditingController regNo = TextEditingController();

  String? _phoneNumber;
  String? _regNo;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
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
                      height: height / 2.5,
                      decoration: const BoxDecoration(
                        // color: Colors.red,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/images/net1.png'),
                        ),
                      ),
                    ),
                    Positioned(
                      top: height / 10.5,
                      left: 20,
                      child: const Text(
                        forgotpasspagehint,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Positioned(
                      top: height / 6,
                      left: 20,
                      child: const Text(
                        logsubtext,
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          color: Color.fromRGBO(179, 179, 179, 1),
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.09,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      TextFieldOne(
                        hinttext: reghint,
                        controller: regNo,
                        onchange: (value) {
                          setState(() {
                            _regNo = value;
                            debugPrint(_phoneNumber);
                          });
                        },
                        obsecuretxt: false,
                      ),
                      TextFieldOne(
                        hinttext: phonehint,
                        keytype: TextInputType.number,
                        controller: phone,
                        onchange: (value) {
                          setState(() {
                            _phoneNumber = value;
                            debugPrint(_phoneNumber);
                          });
                        },
                        obsecuretxt: false,
                      ),

                      SizedBox(
                        height: height * 0.05,
                      ),
                      SizedBox(
                        height: 60,
                        width: height,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(button),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0))),
                          ),
                          child: const Text(
                            forgotpasspagehint,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            alredyaccount,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: width * 0.025,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              loginhint,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.03,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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

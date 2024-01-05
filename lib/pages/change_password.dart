
import 'package:bar_council_main2/utils/constant.dart';
import 'package:flutter/material.dart';

import '../widgets/main_fields.dart';

class ChangePwd extends StatefulWidget{
  const ChangePwd ({super.key});

  @override
  State<ChangePwd> createState() => _ChangePwdState();
}

class _ChangePwdState extends State<ChangePwd> {
  TextEditingController phone = TextEditingController();
  TextEditingController regNo = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  String? _regNo;
  String? _phoneNumber;
  String? _password;
  String? _confirmpassword;

  bool _obscurepassword = true;
  bool _obscureconfirmpassword = true;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
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
                          changepasspagehint,
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
              ],
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
                    TextFieldOne(
                      hinttext: passhint,
                      controller: password,
                      onchange: (value) {
                        setState(() {
                          _password = value;
                          debugPrint(_phoneNumber);
                        });
                      },
                      validator: (value) {},
                      obsecuretxt: _obscurepassword,
                      sufix: IconButton(
                        icon: Icon(
                          _obscurepassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurepassword = !_obscurepassword;
                          });
                        },
                      ),
                    ),
                    TextFieldOne(
                      hinttext: cpasshint,
                      controller: confirmpassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'confirm password is empty.';
                        }
                        return null;
                      },
                      onchange: (value) {
                        setState(() {
                          _confirmpassword = value;
                          debugPrint(_phoneNumber);
                        });
                      },
                      obsecuretxt: _obscureconfirmpassword,
                      sufix: IconButton(
                        icon: Icon(
                          _obscureconfirmpassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureconfirmpassword = !_obscureconfirmpassword;
                          });
                        },
                      ),
                    ),

                    SizedBox(
                      height: height * 0.02,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
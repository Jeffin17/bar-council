import 'package:bar_council_main2/utils/constant.dart';
import 'package:flutter/material.dart';

class SuccessOTP extends StatelessWidget {
  const SuccessOTP({super.key});

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
                        completehint,
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
                    Positioned(
                      top: height / 3.6,
                      left: width / 2.5,
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image:
                                    AssetImage('assets/images/success 1.png'))),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    regsuccesshint,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      fontSize: 23,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Text(
                    sucesssubtitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(179, 179, 179, 1),
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.11,
                ),
                SizedBox(
                  height: 60,
                  width: width * 0.60,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(button),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0))),
                    ),
                    child: const Text(
                      otpok,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.black),
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

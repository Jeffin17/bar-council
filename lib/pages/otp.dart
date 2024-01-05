import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../utils/constant.dart';
import 'homepage.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({
    super.key,
  });
  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  late Timer _resendTimer; // Add this line

  int _resendSeconds = 30; // Initial value for the timer

  @override
  void initState() {
    super.initState();
    _startResendTimer(); // Start the timer when the page is initialized
  }

  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
    _resendTimer.cancel(); // Cancel the timer when the page is disposed
  }

  void _startResendTimer() {
    _resendTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_resendSeconds > 0) {
          _resendSeconds--;
        } else {
          _resendTimer.cancel(); // Cancel the timer when it reaches 0
        }
      });
    });
  }

  void _resetResendTimer() {
    setState(() {
      _resendSeconds = 90;
    });
    _startResendTimer();
  }



  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    const focusedBorderColor = Colors.white;
    const fillColor = Color.fromRGBO(243, 246, 249, 0);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: focusedBorderColor,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: appcolor, width: 1.5),
      ),
    );

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
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/images/net1.png'),
                        ),
                      ),
                    ),

                    Positioned(
                      top: height / 9,
                      left: 20,
                      child: const Text(
                        otphint,
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
                Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Directionality(
                        // Specify direction if desired
                        textDirection: TextDirection.ltr,
                        child: Center(
                          child: Pinput(
                            controller: pinController,
                            focusNode: focusNode,
                            androidSmsAutofillMethod:
                            AndroidSmsAutofillMethod.smsUserConsentApi,
                            listenForMultipleSmsOnAndroid: true,
                            defaultPinTheme: defaultPinTheme,
                            separatorBuilder: (index) =>
                            const SizedBox(width: 15),
                            validator: (value) {
                              return value == "5555" ? null : 'Invalid OTP';
                            },
                            onClipboardFound: (value) {
                              debugPrint('onClipboardFound: $value');
                              pinController.setText(value);
                            },
                            hapticFeedbackType: HapticFeedbackType.lightImpact,
                            onCompleted: (pin) {
                              if ("5555" == pin) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const MyHomePage(),
                                    ));
                              } else {
                                debugPrint('Invalid');
                              }
                            },
                            onChanged: (value) {
                              debugPrint('onChanged: $value');
                            },
                            cursor: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 9),
                                  width: 22,
                                  height: 1,
                                  color: focusedBorderColor,
                                ),
                              ],
                            ),
                            focusedPinTheme: defaultPinTheme.copyWith(
                              decoration: defaultPinTheme.decoration!.copyWith(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: focusedBorderColor),
                              ),
                            ),
                            submittedPinTheme: defaultPinTheme.copyWith(
                              decoration: defaultPinTheme.decoration!.copyWith(
                                color: fillColor,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: focusedBorderColor),
                              ),
                            ),
                            errorPinTheme: defaultPinTheme.copyBorderWith(
                              border: Border.all(color: Colors.redAccent),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * .25,
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
                      // if (_userIdFormKey.currentState!.validate() ||
                      //     _passwordFormKey.currentState!.validate()) {
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => const MyHomePage(),
                      //       ));
                      // }
                    },
                    child: const Text(
                      otpverify,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: height*0.03,
                ),

                TextButton(
                  onPressed: _resendSeconds > 0 ? null : _resetResendTimer, // Disable button during the countdown() { },
                  child: Text(

                    _resendSeconds > 0 ? 'Resend OTP ($_resendSeconds s)' : 'Resend OTP',
                    style: const TextStyle(
                      fontWeight: FontWeight.w200,
                      color: Color.fromRGBO(179, 179, 179, 1),
                      fontSize: 12,
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

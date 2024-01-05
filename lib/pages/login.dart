
import 'package:bar_council_main2/pages/registration.dart';
import 'package:flutter/material.dart';
import '../utils/constant.dart';
import '../widgets/main_fields.dart';
import 'homepage.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;

  TextEditingController userid = TextEditingController();
  TextEditingController password = TextEditingController();
  final _userIdFormKey = GlobalKey<FormState>();
  final _passwordFormKey = GlobalKey<FormState>();
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    double top = MediaQuery.of(context).padding.top;

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
                  Padding(
                    padding: EdgeInsets.only(top: top * 2),
                    child: Container(
                      height: height * .45,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/images/net.png'),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: top * 3,
                    left: 20,
                    child: const Text(
                      welcome,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Positioned(
                    top: top * 5,
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
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    Form(
                      key: _userIdFormKey,
                      child: TextFieldOne(
                        hinttext: reghint,
                        controller: userid,
                        onchange: (value) {
                          _userIdFormKey.currentState!.validate();
                          debugPrint(userid.text);
                        },
                        obsecuretxt: false,
                      ),
                    ),
                    SizedBox(
                      height: height * .005,
                    ),
                    Form(
                      key: _passwordFormKey,
                      child: TextFieldOne(
                        hinttext: passhint,
                        controller: password,
                        onchange: (value) {
                          _passwordFormKey.currentState!.validate();
                        },
                        obsecuretxt: _obscureText,
                        sufix: IconButton(
                          icon: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * .05,
                    ),
                    SizedBox(
                      height: 60,
                      width: height,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(button),
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(18.0))),),
                        onPressed: () {
                          if (_userIdFormKey.currentState!.validate() ||
                              _passwordFormKey.currentState!.validate()) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const MyHomePage(),
                            ));
                          }
                        },
                        child: const Text(
                          loginhint,
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * .03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            forogtpasshint,
                            style: TextStyle(
                              color: Colors.white.withOpacity(.6),
                              fontSize: width * 0.03,
                            ),
                          ),
                        ),
                        Text(
                          acnt,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: width * 0.025,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Registration(),
                                ));
                          },
                          child: Text(
                            signuphint,
                            style: TextStyle(
                              color: button,
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
    );
  }
}

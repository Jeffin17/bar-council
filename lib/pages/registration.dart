
import 'package:bar_council_main2/services/otpapi.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../services/registration_loginapi.dart';
import '../utils/constant.dart';
import '../widgets/main_fields.dart';
import 'dart:io';
import 'login.dart';
import 'otp.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  File? _image;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImageFromGallery() async {
    final pickedFile =
    await _picker.pickImage(source: ImageSource.gallery, imageQuality: 15);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
    }
    setState(() {});
  }

  Future<void> _pickImageFromCamera() async {
    final pickedFile =
    await _picker.pickImage(source: ImageSource.camera, imageQuality: 15);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
    }
    setState(() {});
  }

  var datas;

  bool _obscurepassword = true;
  bool _obscureconfirmpassword = true;

  final useridkey = GlobalKey<FormState>();
  final phonekey = GlobalKey<FormState>();
  final passwordkey = GlobalKey<FormState>();
  final confirmpasswordkey = GlobalKey<FormState>();

  TextEditingController regNo = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController joinyear = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  String? _regNo;
  String? _phoneNumber;
  String? _joinyear;
  String? _password;
  String? _confirmpassword;

  String? _dob;


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    // double top = MediaQuery.of(context).padding.top;

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
                    top: height / 3.8,
                    left: width / 2.7,
                    child: Center(
                      child: Stack(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 50,
                            backgroundImage: _image != null
                                ? Image.file(File(_image!.path)).image
                                : const AssetImage('assets/images/man.png'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: height / 9,
                    left: 20,
                    child: const Text(
                      signuphint,
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
                      top: height / 2.9,
                      left: width / 1.9,
                      child: IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                // int total = 0;
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  actions: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20, bottom: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              _pickImageFromCamera();
                                              Navigator.pop(context);
                                            },
                                            child: const Column(
                                              children: [
                                                Icon(
                                                  Icons.camera_alt,
                                                  size: 50,
                                                ),
                                                SizedBox(
                                                  height: 30,
                                                  child: Text(
                                                    'Camera',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                        FontWeight.bold),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              _pickImageFromGallery();
                                              Navigator.pop(context);
                                            },
                                            child: const Column(
                                              children: [
                                                Icon(
                                                  Icons.image,
                                                  size: 50,
                                                ),
                                                SizedBox(
                                                  height: 30,
                                                  child: Text('Gallery',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                          FontWeight.bold)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          icon: Icon(
                            Icons.add_a_photo,
                            color: Colors.grey.shade300,
                            size: 25,
                          ))),
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

                    //Joining Year
                    TextFieldOne(
                      hinttext: joinyearhint,
                      controller: joinyear,
                      onchange: (value) {
                        setState(() {
                          _joinyear = value;
                          debugPrint(_phoneNumber);
                        });
                      },
                      obsecuretxt: false,

                      sufix: IconButton(
                        onPressed: () async {
                          DateTime? selectedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                          );

                          if (selectedDate != null && selectedDate != DateTime.now()) {
                            String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);

                            setState(() {
                              _joinyear = formattedDate;
                              joinyear.text = _joinyear!;
                            });
                          }
                        },
                        icon: const Icon(
                          Icons.calendar_month_outlined,
                          color: iconcolor,
                          size: 30,
                        ),
                      ),
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
                      height: height * .03,
                    ),
                    SizedBox(
                      height: 60,
                      width: height,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(18.0))),
                          backgroundColor: MaterialStateProperty.all(button),
                        ),
                        // onPressed: () {
                        //   // uploadImage(_image!,_regNo!,_phoneNumber!,_password!);
                        //   sendOtp(_phoneNumber!);
                        //   print('$_regNo$_phoneNumber$_password');
                        //   // if (useridkey.currentState!.validate() ||
                        //   //     phonekey.currentState!.validate() ||
                        //   //     passwordkey.currentState!.validate() ||
                        //   //     confirmpasswordkey.currentState!.validate()) {
                        //   // verifyOtp(phoneNumber!);
                        //   // UploadImage();
                        //
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) => OtpPage(),
                        //       ));
                        //
                        //   debugPrint('new');
                        //   // }
                        // },

                        onPressed: () async {
                          try {
                            Map<String, dynamic> registrationResult = await RegistrationApi.registerUser(
                              regNo: _regNo!,
                              phoneNumber: _phoneNumber!,
                              password: _password!,
                              confirmpassword: _confirmpassword!,
                              // image: _image!,
                            );

                            // Handle the registration result
                            print('Registration result: $registrationResult');

                            // If the registration was successful, proceed to OTP page
                            if (registrationResult['success']) {
                              sendOtp(_phoneNumber!);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OtpPage(),
                                ),
                              );
                            } else {
                              // Handle registration failure
                              print('Registration failed: ${registrationResult['message']}');
                              // You might want to display an error message to the user
                            }
                          } catch (error) {
                            // Handle any errors that occurred during the API call
                            print('Error during registration: $error');
                            // You might want to display an error message to the user
                          }
                        },





                        child: const Text(
                          signuphint,
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                            fontSize: 20,
                          ),
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
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()));
                          },
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
    );
  }
}

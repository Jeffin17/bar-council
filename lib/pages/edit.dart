import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/constant.dart';
import '../widgets/MyBottomNavBar_final.dart';
import '../widgets/main_fields.dart';

class Edit extends StatefulWidget {
  const Edit({Key? key}) : super(key: key);

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController whatsapp = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController state = TextEditingController();


  String? _firstname;
  String? _lastname;
  String? _email;
  String? _dob;
  String? _phone;
  String? _whatsapp;
  String? _address;
  String? _pincode;
  String? _district;
  String? _state;


  bool isCheckboxUnchecked = true;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      bottomNavigationBar: MyBottomNavBar(),
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {
          if (!FocusScope.of(context).hasPrimaryFocus) {
            FocusScope.of(context).unfocus();
          }
        },
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned(
                left: width / 2.7,
                top: height / 13.5,
                child: const Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50,
                    foregroundColor: Colors.grey,
                    backgroundImage: AssetImage(
                      'assets/images/man.png',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 20.0, // Add vertical padding for better spacing
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 110 + 50,
                    ),
                    TextFieldOne(
                      hinttext: firstnamehint,
                      controller: firstname,
                      onchange: (value) {
                        setState(() {
                          _firstname = value;
                          debugPrint(_firstname);
                        });
                      },
                      obsecuretxt: false,
                    ),
                    TextFieldOne(
                      hinttext: lastnamehint,
                      controller: lastname,
                      onchange: (value) {
                        setState(() {
                          _lastname = value;
                          debugPrint(_lastname);
                        });
                      },
                      obsecuretxt: false,
                    ),
                    TextFieldOne(
                      hinttext: emailhint,
                      controller: email,
                      onchange: (value) {
                        setState(() {
                          _email = value;
                          debugPrint(_email);
                        });
                      },
                      obsecuretxt: false,
                    ),
                    TextFieldOne(
                      hinttext: dobhint, // Provide a hint text for the calendar TextField
                      controller: dob,
                      onchange: (value) {
                        setState(() {
                          _dob = value;
                          debugPrint(_dob);
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
                              _dob = formattedDate;
                              dob.text = _dob!;
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
                    Row(
                      children: [
                        Expanded(
                          child: TextFieldOne(
                            keytype: TextInputType.number,
                            hinttext: phonenohint,
                            controller: phone,
                            onchange: (value) {
                              setState(() {
                                _phone = value;
                                debugPrint(_phone);
                              });
                            },
                            obsecuretxt: false,
                          ),
                        ),
                        Checkbox(
                          value: isCheckboxUnchecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isCheckboxUnchecked = !isCheckboxUnchecked!;
                            });
                          },
                          checkColor: Colors.black,
                          activeColor: Colors.white,
                        ),
                        Container(
                          height: 45,
                          width: 45,
                          decoration: const BoxDecoration(image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/whatsapp.png"))),
                        )
                      ],
                    ),

                    Visibility(
                      visible: !isCheckboxUnchecked,
                      child: TextFieldOne(
                        hinttext: whatsapphint,
                        controller: whatsapp,
                        keytype: TextInputType.number,
                        onchange: (value) {
                          setState(() {
                            _whatsapp = value;
                            debugPrint(_whatsapp);
                          });
                        },
                        obsecuretxt: false,
                      ),
                    ),

                    Container(
                      height: height*0.20,
                      decoration: BoxDecoration(borderRadius: BorderRadius.zero),
                      child: TextFieldOne(
                        hinttext: addresshint,
                        controller: address,
                        onchange: (value) {
                          setState(() {
                            _address = value;
                            debugPrint(_address);
                          });
                        },
                        obsecuretxt: false,
                      ),
                    ),
                    TextFieldOne(
                      keytype: TextInputType.number,
                      hinttext: pincodehint,
                      controller: pincode,
                      onchange: (value) {
                        setState(() {
                          _pincode = value;
                          debugPrint(_pincode);
                        });
                      },
                      obsecuretxt: false,
                    ),
                    TextFieldOne(
                      hinttext: districthint,
                      controller: district,
                      onchange: (value) {
                        setState(() {
                          _district = value;
                          debugPrint(_district);
                        });
                      },
                      obsecuretxt: false,
                    ),
                    TextFieldOne(
                      hinttext: statehint,
                      controller: state,
                      onchange: (value) {
                        setState(() {
                          _state = value;
                          debugPrint(_state);
                        });
                      },
                      obsecuretxt: false,
                    ),

                    SizedBox(
                      height: height*0.03,
                    ),
                    SizedBox(
                      height: 60,
                      width: width,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(button),
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(18.0))),),
                        onPressed: () {},
                        child: const Text(
                          savehint,
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
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

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/constant.dart';

class TextFieldOne extends StatefulWidget {
  const TextFieldOne({
    super.key,
    required this.hinttext,
    required this.controller,
    required this.onchange,
    required this.obsecuretxt,
    this.preicon,
    this.keytype,
    this.fillcolor,
    this.sufix,
    this.validator
  });

  final String hinttext;
  final TextEditingController controller;
  final ValueChanged onchange;
  final bool obsecuretxt;
  final IconData? preicon;
  final IconButton? sufix;
  final TextInputType? keytype;
  final Color? fillcolor;
  final String? Function(String?)? validator;

  @override
  State<TextFieldOne> createState() => _TextFieldOneState();
}

class _TextFieldOneState extends State<TextFieldOne> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 10, bottom: 10),
      child: TextFormField(
        keyboardType: widget.keytype,
        decoration: InputDecoration(
          suffixIcon: widget.sufix,
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(18)),
            borderSide: BorderSide(width: 1, color: Colors.red),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(
                width: 2, color: appcolor), // Border color when not in focus
          ),
          labelText: widget.hinttext,
          labelStyle: GoogleFonts.poppins(color: Colors.grey.withOpacity(.8)),
          fillColor: widget.fillcolor ?? appcolor.withOpacity(.05),
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(
                width: 2, color: appcolor), // Border color when focused
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(color: Colors.white)),
        ),
        style: const TextStyle(
          color: Colors.white,
        ),
        validator: widget.validator,
        //     (value) {
        //   if (value == null || value.isEmpty) {
        //     return 'This field is required.';
        //   }
        //   return null;
        // },
        cursorColor: appcolor,
        obscureText: widget.obsecuretxt,
        obscuringCharacter: '*',
        controller: widget.controller,
        onChanged: widget.onchange,
      ),
    );
  }
}

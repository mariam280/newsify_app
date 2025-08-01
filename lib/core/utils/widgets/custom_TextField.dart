import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
  CustomFormTextField(
      {super.key, this.hintText, this.onChanged, this.obscureText = false,  this.suffixIcon,this.validator, this.labelText});
  Function(String)? onChanged;
  String? hintText;
  String? labelText;
  bool? obscureText;
  final IconButton? suffixIcon;
  String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
      child: TextFormField(
        cursorColor: Colors.black,
        obscureText: obscureText!,
        validator: validator,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 20,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
         suffixIcon: suffixIcon,
         focusedBorder: buildBorder(),
          enabledBorder: buildBorder(),
          border: buildBorder(),
        ),
      ),
    );
  }

  UnderlineInputBorder buildBorder() {
    return UnderlineInputBorder(
    borderSide: const BorderSide(
      color: Colors.black,
      width: 1.0,
    ),
  );
  }
}

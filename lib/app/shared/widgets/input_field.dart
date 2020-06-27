import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final IconData icon;
  final String hint;
  final bool obscure;
  final Function(String) onChanged;
  final Function onTap;
  final String errorText;
  final String imgFolder;
  final TextInputType keyboardType;
  final Color hintColor;
  final Color inputTextColor;
  final String labelText;
  final Icon prefixIcon;
  final String suffixText;
  final TextStyle suffixStyle;
  final bool error;

  InputField({
    this.hint,
    this.icon,
    this.obscure = false,
    this.onChanged,
    this.onTap,
    this.errorText,
    this.imgFolder,
    this.keyboardType = TextInputType.text,
    this.hintColor,
    this.inputTextColor,
    this.labelText,
    this.prefixIcon,
    this.suffixText,
    this.suffixStyle,
    this.error = false,
  });

  @override
  Widget build(BuildContext context) {
    var errorColor = error ? Colors.red : Colors.white;

    return Theme(
      data: new ThemeData(
        primaryColor: Colors.white,
        hintColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          border: new OutlineInputBorder(
            borderSide: new BorderSide(
              color: Colors.white,
            ),
          ),
          labelStyle: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),
      child: TextField(
        onChanged: onChanged,
        keyboardType: keyboardType,
        onTap: onTap,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixText: suffixText,
          suffixStyle: suffixStyle,
          labelText: labelText,
          hintText: hint,
          hintStyle: TextStyle(
            color: hintColor,
            fontSize: 16,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            // width: 0.0 produces a thin "hairline" border
            borderSide: const BorderSide(color: Colors.white, width: 1.0),
          ),
          errorBorder: OutlineInputBorder(
            // width: 0.0 produces a thin "hairline" border
            borderSide: BorderSide(color: errorColor, width: 1.0),
          ),
          errorText: errorText,
        ),
        style: TextStyle(
          color: inputTextColor,
          fontSize: 20,
        ),
        obscureText: obscure,
      ),
    );
  }
}

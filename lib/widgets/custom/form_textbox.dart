import 'package:flutter/material.dart';

// defining a type for the function used to validate the textbox
typedef ValidatorFunction = String? Function(String? value)?;

// * TextBox that is used for the log in and sign up pages
class FormTextBox extends StatefulWidget {
  final String label;
  final TextInputType keyboardType;
  final bool obscureText;
  final TextEditingController controller;
  final ValidatorFunction validator;
  final Function(String val)? onChanged;
  const FormTextBox(
      {key,
      required this.label,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      required this.controller,
      this.validator,
      this.onChanged})
      : super(key: key);

  @override
  State<FormTextBox> createState() => _FormTextBoxState();
}

class _FormTextBoxState extends State<FormTextBox> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      obscureText: widget.obscureText,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        hintText: widget.label,
      ),
      validator: widget.validator,
    );
  }
}

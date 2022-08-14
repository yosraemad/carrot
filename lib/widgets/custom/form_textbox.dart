import 'package:flutter/material.dart';

typedef ValidatorFunction = String? Function(String? value)?;

class FormTextBox extends StatefulWidget {
  final String label;
  final TextInputType keyboardType;
  final bool obscureText;
  final TextEditingController controller;
  final ValidatorFunction validator;
  final Function(String val)? onChanged;
  const FormTextBox(
      {super.key,
      required this.label,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      required this.controller,
      this.validator,
      this.onChanged});

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

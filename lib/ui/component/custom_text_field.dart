import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/const/color.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final String? value;
  final Function(String? newValue) onSaved;
  final String? Function(String? validator) validator;

  const CustomTextField({Key? key, required this.label, required this.hint, required this.onSaved, required this.validator, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.grey,
      maxLines: 1,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        border: InputBorder.none,
        filled: true,
        fillColor: TEXT_FIELD_FILL_COLOR,
        hintText: hint,
        hintStyle: TextStyle(
          color: DARK_GREY_COLOR,
          fontWeight: FontWeight.w600
        )
      ),
      onSaved: onSaved,
      validator: validator,
      initialValue: value,
    );
  }
}

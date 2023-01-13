import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/const/color.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool isTime;

  const CustomTextField({Key? key, required this.label, required this.isTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: PRIMARY_COLOR,
              fontWeight: FontWeight.w600,
            ),
          ),
          Expanded(
            flex: isTime ? 0 : 1,
            child: TextFormField(
              cursorColor: Colors.grey,
              maxLines: isTime ? 1 : null,
              expands: !isTime,
              keyboardType: isTime ? TextInputType.number : TextInputType.multiline,
              inputFormatters: isTime ? [
                FilteringTextInputFormatter.digitsOnly, // 시간 입력하는 텍스트 필드인 경우 숫자만 입력가능
              ] : [],
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: TEXT_FIELD_FILL_COLOR,
                suffixText: isTime ? '시' : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

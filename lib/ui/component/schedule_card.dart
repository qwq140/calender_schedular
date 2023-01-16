import 'package:flutter/material.dart';
import 'package:todo_app/const/color.dart';

class ScheduleCard extends StatelessWidget {
  final String content;
  final bool isDone;
  final Function(bool? newValue) onChanged;

  const ScheduleCard({
    Key? key,
    required this.content,
    required this.isDone,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: PRIMARY_COLOR),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: Checkbox(
                shape: CircleBorder(),
                activeColor: PRIMARY_COLOR,
                value: isDone,
                onChanged: onChanged,
              ),
            ),
            const SizedBox(width: 16),
            _Content(content: content),
          ],
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  final String content;

  const _Content({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        content,
      ),
    );
  }
}

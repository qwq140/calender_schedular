import 'package:flutter/material.dart';
import 'package:todo_app/const/color.dart';
import 'package:todo_app/ui/component/custom_text_field.dart';

class ScheduleAddBottomSheet extends StatefulWidget {
  const ScheduleAddBottomSheet({Key? key}) : super(key: key);

  @override
  State<ScheduleAddBottomSheet> createState() => _ScheduleAddBottomSheetState();
}

class _ScheduleAddBottomSheetState extends State<ScheduleAddBottomSheet> {
  @override
  Widget build(BuildContext context) {

    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      height: MediaQuery.of(context).size.height / 2 + bottomInset,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: bottomInset),
        child: Column(
          children: [
            Row(
              children: const [
                CustomTextField(label: '시작시간', isTime: true),
                SizedBox(width: 16),
                CustomTextField(label: '종료시간', isTime: true),
              ],
            ),
            const CustomTextField(label: '내용', isTime: false),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: PRIMARY_COLOR,
                ),
                child: const Text('저장'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

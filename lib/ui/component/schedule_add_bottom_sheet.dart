import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/const/color.dart';
import 'package:todo_app/provider/schedule_provider.dart';
import 'package:todo_app/ui/component/custom_text_field.dart';
import 'package:todo_app/utils/validator.dart';

class ScheduleAddBottomSheet extends StatefulWidget {
  const ScheduleAddBottomSheet({Key? key}) : super(key: key);

  @override
  State<ScheduleAddBottomSheet> createState() => _ScheduleAddBottomSheetState();
}

class _ScheduleAddBottomSheetState extends State<ScheduleAddBottomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey();

  int? startTime;
  int? endTime;
  String? content;

  void onSavePressed() async {
    if(!formKey.currentState!.validate()) return;
    formKey.currentState!.save();
    print(startTime);
    print(endTime);
    print(content);
    await context.read<ScheduleProvider>().createSchedule(startTime: startTime!, endTime: endTime!, content: content!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Form(
      key: formKey,
      child: Container(
        height: MediaQuery.of(context).size.height / 2 + bottomInset,
        color: Colors.white,
        child: Padding(
          padding:
              EdgeInsets.only(top: 8, left: 8, right: 8, bottom: bottomInset),
          child: Column(
            children: [
              Row(
                children: [
                  CustomTextField(
                    label: '시작시간',
                    isTime: true,
                    onSaved: (newValue) {
                      startTime = int.parse(newValue!);
                    },
                    validator: timeValidator,
                  ),
                  const SizedBox(width: 16),
                  CustomTextField(
                    label: '종료시간',
                    isTime: true,
                    onSaved: (newValue) {
                      endTime = int.parse(newValue!);
                    },
                    validator: timeValidator,
                  ),
                ],
              ),
              CustomTextField(
                label: '내용',
                isTime: false,
                onSaved: (newValue) {
                  content = newValue;
                },
                validator: contentValidator,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onSavePressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: PRIMARY_COLOR,
                  ),
                  child: const Text('저장'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
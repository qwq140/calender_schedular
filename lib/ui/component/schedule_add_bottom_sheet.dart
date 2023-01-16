import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/const/color.dart';
import 'package:todo_app/provider/schedule_provider.dart';
import 'package:todo_app/ui/component/custom_text_field.dart';
import 'package:todo_app/utils/data_utils.dart';
import 'package:todo_app/utils/validator.dart';

class ScheduleAddBottomSheet extends StatefulWidget {
  const ScheduleAddBottomSheet({Key? key}) : super(key: key);

  @override
  State<ScheduleAddBottomSheet> createState() => _ScheduleAddBottomSheetState();
}

class _ScheduleAddBottomSheetState extends State<ScheduleAddBottomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey();

  String? content;

  void onSavePressed() async {
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();
    print(content);
    await context.read<ScheduleProvider>().createSchedule(content: content!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Form(
      key: formKey,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.only(top : 8, left: 16, right: 16, bottom: bottomInset),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                convertDateToString(
                    context.read<ScheduleProvider>().selectedDate),
                style: TextStyle(
                  color: DARK_GREY_COLOR,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              CustomTextField(
                label: '내용',
                onSaved: (newValue) {
                  content = newValue;
                },
                hint: '여기에 새 작업 입력',
                validator: contentValidator,
              ),
              const SizedBox(height: 8),
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

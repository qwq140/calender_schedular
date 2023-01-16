import 'package:todo_app/database/drift_database.dart';

class DataUtils {
  /// 캘린더에서 int 값의 요일을 String 요일로 변환
  static String convertWeekdayToStringValue(int weekDay) {
    switch (weekDay) {
      case 1:
        return '월';
      case 2:
        return '화';
      case 3:
        return '수';
      case 4:
        return '목';
      case 5:
        return '금';
      case 6:
        return '토';
      case 7:
        return '일';
    }
    return '';
  }

  /// DateTime을 String으로 변환
  static String convertDateToString(DateTime date) => "${date.year}년 ${date.month}월 ${date.day}일";

  /// DB에서 데이터 불러올 때 사용
  static DateTime getStartDate(DateTime date) => DateTime(date.year, date.month, 1);
  static DateTime getEndDate(DateTime date) => DateTime(date.year, date.month + 1, 0);

  /// year, month, date 비교
  static bool compareDate(DateTime date1, DateTime date2) => date1.year == date2.year && date1.month == date2.month && date1.day == date2.day;

  /// 해당 날짜의 작업이 있는 가?
  static bool isDaySchedules(List<Schedule> schedules, DateTime date) {
    List<Schedule> list = schedules.where((schedule) => date.month == schedule.date.month && date.day == schedule.date.day).toList();
    return list.isNotEmpty;
  }

  /// 해당 날짜의 작업들이 모두 완료 되었는지?
  static bool isComplete(List<Schedule> schedules, DateTime date){
    /// 해당 날짜 작업들 중 완료하지 않은게 하나라도 있으면 false 없으면 true
    List<Schedule> list = schedules.where((schedule) => date.month == schedule.date.month && date.day == schedule.date.day && !schedule.isDone).toList();
    return list.isEmpty;
  }
}
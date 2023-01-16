String convertWeekdayToStringValue(int weekDay) {
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

String convertDateToString(DateTime date) => "${date.year}년 ${date.month}월 ${date.day}일";

DateTime getStartDate(DateTime date) => DateTime(date.year, date.month, 1);
DateTime getEndDate(DateTime date) => DateTime(date.year, date.month + 1, 0);

/**
 * year, month, date 비교
 */
bool compareDate(DateTime date1, DateTime date2) => date1.year == date2.year && date1.month == date2.month && date1.day == date2.day;
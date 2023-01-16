import 'dart:io';

import 'package:drift/drift.dart';
import 'package:todo_app/model/schedules.dart';

import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:todo_app/utils/data_utils.dart';

part 'drift_database.g.dart';

@DriftDatabase(
    tables : [
      Schedules,
    ],
)
class LocalDatabase extends _$LocalDatabase {

  LocalDatabase() : super(_openConnection());

  Stream<List<Schedule>> watchSchedules(DateTime date) => (select(schedules)..where((tbl) => (tbl.date.isBiggerThanValue(getStartDate(date)) & tbl.date.isSmallerOrEqualValue(getEndDate(date))))).watch();
  Future<int> createSchedule(SchedulesCompanion data) => into(schedules).insert(data);
  Future<int> removeSchedule(int id) => (delete(schedules)..where((tbl) => tbl.id.equals(id))).go();
  Future<int> doneSchedule(int id, bool isDone) => (update(schedules)..where((tbl) => tbl.id.equals(id))).write(SchedulesCompanion(isDone: Value(isDone)));

  @override
  int get schemaVersion => 1;
}

// 드리프트 데이터베이스 객체는 부모 생성자에 LazyDatabase를 필수로 넣어줘야 한다.
// LazyDatabase 객체에는 데이터베이스를 생성할 위치에 대한 정보를 입력해주면 된다.
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    // 데이터베이스 파일을 저장할 폴더
    final dbDirectory = await getApplicationDocumentsDirectory();
    final file = File(join(dbDirectory.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
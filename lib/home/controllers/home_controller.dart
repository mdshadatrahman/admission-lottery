import 'package:admission_lottery/models/student_model.dart';
import 'package:excel/excel.dart';
import 'package:flutter/services.dart';
import 'package:get/state_manager.dart';
import 'dart:developer' as developer show log;

class HomeController extends GetxController {
  RxInt selectedClass = 3.obs;
  RxString version = 'English'.obs;
  RxString shift = 'Morning'.obs;
  RxList<Student> students = <Student>[].obs;

  final String excelFile = 'assets/dataset.xlsx';

  readDataFromExcelSheet() async {
    try {
      ByteData data = await rootBundle.load(excelFile);
      var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      var excel = Excel.decodeBytes(bytes);
      students.clear();
      for (var table in excel.tables.keys) {
        for (var row in excel.tables[table]!.rows) {
          // for (int i = 1; i < excel.tables[table]!.rows.length; i++) {
          // var row = excel.tables[table]!.rows[i];
          students.add(
            Student(
              sl: row[0]?.value.toString(),
              roll: row[1]?.value.toString(),
              isFq: row[2]?.value.toString(),
              isEq: row[3]?.value.toString(),
              isCaq: row[4]?.value.toString(),
              isSibling: row[5]?.value.toString(),
              isGeneral: row[6]?.value.toString(),
            ),
          );
        }
      }
    } catch (e) {
      developer.log('Error: $e', name: 'HomeController.readDataFromExcelSheet');
    }
  }
}

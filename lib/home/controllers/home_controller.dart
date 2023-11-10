import 'package:admission_lottery/home/controllers/quota_eligible_students_controller.dart';
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
  RxList<Student> showStudents = <Student>[].obs;

  RxList<Student> fqEligibleStudents = <Student>[].obs;
  RxList<Student> eqEligibleStudents = <Student>[].obs;
  RxList<Student> caqEligibleStudents = <Student>[].obs;
  RxList<Student> siblingEligibleStudents = <Student>[].obs;

  final String excelFile = 'assets/dataset.xlsx';

  readDataFromExcelSheet() async {
    try {
      ByteData data = await rootBundle.load(excelFile);
      var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      var excel = Excel.decodeBytes(bytes);
      students.clear();
      for (var table in excel.tables.keys) {
        for (var row in excel.tables[table]!.rows) {
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
      students.removeAt(0);
    } catch (e) {
      developer.log('Error: $e', name: 'HomeController.readDataFromExcelSheet');
    }
  }

  void filterStudents() {
    fqEligibleStudents.value = QuotaEligibleStudentsController.getFqEligibleStudents(
      students: students,
    );
    eqEligibleStudents.value = QuotaEligibleStudentsController.getEqEligibleStudents(
      students: students,
    );
    caqEligibleStudents.value = QuotaEligibleStudentsController.getCaqEligibleStudents(
      students: students,
    );
    siblingEligibleStudents.value = QuotaEligibleStudentsController.getSiblingEligibleStudents(
      students: students,
    );
  }
}

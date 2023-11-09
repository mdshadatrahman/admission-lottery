import 'package:admission_lottery/models/student_model.dart';
import 'package:excel/excel.dart';
import 'package:flutter/services.dart';
import 'package:get/state_manager.dart';

class HomeController extends GetxController {
  RxInt selectedClass = 3.obs;
  RxString version = 'English'.obs;
  RxString shift = 'Morning'.obs;
  RxList<Student> students = <Student>[].obs;

  final String excelFile = 'assets/dataset.xlsx';

  readDataFromExcelSheet() async {
    ByteData data = await rootBundle.load(excelFile);
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);
    students.clear();
    for (var table in excel.tables.keys) {
      for (var row in excel.tables[table]!.rows) {
        students.add(
          Student(
            sl: row[0]?.value,
            roll: row[1]?.value,
            isFq: row[2]?.value,
            isEq: row[3]?.value,
            isCaq: row[4]?.value,
            isSibling: row[5]?.value,
            isGeneral: row[6]?.value,
          ),
        );
      }
    }
  }
}

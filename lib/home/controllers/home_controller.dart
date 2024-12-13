import 'dart:io';
import 'package:admission_lottery/home/controllers/quota_eligible_students_controller.dart';
import 'package:admission_lottery/models/student_model.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/state_manager.dart';
import 'dart:developer' as developer show log;

class HomeController extends GetxController {
  RxBool isLoading = false.obs;

  RxInt selectedClass = 3.obs;
  RxString version = 'English'.obs;
  RxString shift = 'Morning'.obs;
  RxString res = 'Mandatory Resident'.obs;
  RxString selectedMajor = 'Science'.obs;

  RxList<Student> students = <Student>[].obs;
  RxList<Student> showStudents = <Student>[].obs;

  RxList<Student> fqEligibleStudents = <Student>[].obs;
  RxList<Student> eqEligibleStudents = <Student>[].obs;
  RxList<Student> caqEligibleStudents = <Student>[].obs;
  RxList<Student> siblingEligibleStudents = <Student>[].obs;
  RxList<Student> twinEligibleStudents = <Student>[].obs;
  RxList<Student> lillahBoardingEligibleStudents = <Student>[].obs;
  RxList<Student> disabilityEligibleStudents = <Student>[].obs;

  Future<void> pickFile() async {
    isLoading.value = true;
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['xlsx'],
      );
      if (result != null) {
        readDataFromExcelSheet(result.files.single.path!);
      }
    } catch (e) {
      developer.log('Error: $e', name: 'HomeController.pickFile');
    }
    isLoading.value = false;
  }

  readDataFromExcelSheet(String path) async {
    try {
      var bytes = File(path).readAsBytesSync();
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
              isTwin: row[6]?.value.toString(),
              isLillahBoarding: row[7]?.value.toString(),
              isDisablity: row[8]?.value.toString(),
              isGeneral: row[9]?.value.toString(),
            ),
          );
        }
      }
      students.removeAt(0); // Remove the first row which is the header
    } catch (e) {
      developer.log('Error: $e', name: 'HomeController.readDataFromExcelSheet');
    }
  }

  void filterStudents() {
    fqEligibleStudents.value = QuotaEligibleStudentsController.getFqOrEqEligibleStudents(
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

    twinEligibleStudents.value = QuotaEligibleStudentsController.getTwinEligibleStudents(
      students: students,
    );

    lillahBoardingEligibleStudents.value = QuotaEligibleStudentsController.getLillahBoardingEligibleStudents(
      students: students,
    );

    disabilityEligibleStudents.value = QuotaEligibleStudentsController.getDisabilityEligibleStudents(
      students: students,
    );
  }
}

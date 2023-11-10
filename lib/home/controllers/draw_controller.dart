// ignore_for_file: invalid_use_of_protected_member

import 'package:admission_lottery/home/controllers/home_controller.dart';
import 'package:admission_lottery/models/student_model.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'dart:developer' as developer show log;

import 'package:get/state_manager.dart';

class DrawController extends GetxController {
  final homeController = Get.put(HomeController());

  final List<Student> _fqEligibleStudents = <Student>[];
  final List<Student> _eqEligibleStudents = <Student>[];
  final List<Student> _caqEligibleStudents = <Student>[];
  final List<Student> _siblingEligibleStudents = <Student>[];

  @override
  void onInit() {
    super.onInit();
    _fqEligibleStudents.addAll(homeController.fqEligibleStudents.value);
    _eqEligibleStudents.addAll(homeController.eqEligibleStudents.value);
    _caqEligibleStudents.addAll(homeController.caqEligibleStudents.value);
    _siblingEligibleStudents.addAll(homeController.siblingEligibleStudents.value);
  }

  final RxList<Student> fqAdmittedStudents = <Student>[].obs;
  final RxList<Student> eqAdmittedStudents = <Student>[].obs;
  final RxList<Student> caqAdmittedStudents = <Student>[].obs;
  final RxList<Student> siblingAdmittedStudents = <Student>[].obs;

  final List<Student> generalStudents = <Student>[];

  void drawFqEligibleStudents({
    required int numberOfStudentsToBeAdmitted,
    required int percentageOfFqQuota,
  }) {
    fqAdmittedStudents.value.clear();
    _fqEligibleStudents.shuffle();
    int numberOfFqEligibleStudents = (numberOfStudentsToBeAdmitted * percentageOfFqQuota / 100).round();
    for (int i = 0; i < numberOfFqEligibleStudents; i++) {
      fqAdmittedStudents.add(_fqEligibleStudents[i]);
    }
  }

  void drawEqEligibleStudents({
    required int numberOfStudentsToBeAdmitted,
    required int percentageOfEqQuota,
  }) {
    eqAdmittedStudents.value.clear();
    final List<Student> eqEligibleUpdatedStudents = <Student>[];
    eqEligibleUpdatedStudents.addAll(_eqEligibleStudents);

    // If the remaining fq students has eq quota, then they will be admitted first
    for (int i = 0; i < _fqEligibleStudents.length; i++) {
      if (_fqEligibleStudents[i].isEq?.toLowerCase() == 'eq' && !fqAdmittedStudents.contains(_fqEligibleStudents[i])) {
        if (eqEligibleUpdatedStudents.contains(_fqEligibleStudents[i])) {
          eqEligibleUpdatedStudents.remove(_fqEligibleStudents[i]);
        }
        eqEligibleUpdatedStudents.add(_fqEligibleStudents[i]);
      }
    }
    eqEligibleUpdatedStudents.shuffle();
    int numberOfEqEligibleStudents = (numberOfStudentsToBeAdmitted * percentageOfEqQuota / 100).round();
    for (int i = 0; i < numberOfEqEligibleStudents; i++) {
      eqAdmittedStudents.add(eqEligibleUpdatedStudents[i]);
    }
  }
}

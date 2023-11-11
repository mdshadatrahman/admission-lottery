// ignore_for_file: invalid_use_of_protected_member

import 'package:admission_lottery/home/controllers/home_controller.dart';
import 'package:admission_lottery/models/student_model.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'dart:developer' as developer show log;

class DrawController extends GetxController {
  final homeController = Get.put(HomeController());

  // final List<Student> _fqEligibleStudents = <Student>[];
  // final List<Student> _eqEligibleStudents = <Student>[];
  // final List<Student> _caqEligibleStudents = <Student>[];
  // final List<Student> _siblingEligibleStudents = <Student>[];

  @override
  void onInit() {
    super.onInit();
    // _fqEligibleStudents.addAll(homeController.fqEligibleStudents.value);
    // _eqEligibleStudents.addAll(homeController.eqEligibleStudents.value);
    // _caqEligibleStudents.addAll(homeController.caqEligibleStudents.value);
    // _siblingEligibleStudents.addAll(homeController.siblingEligibleStudents.value);
  }

  final RxList<Student> fqAdmittedStudents = <Student>[].obs;
  final RxList<Student> eqAdmittedStudents = <Student>[].obs;
  final RxList<Student> caqAdmittedStudents = <Student>[].obs;
  final RxList<Student> siblingAdmittedStudents = <Student>[].obs;
  final RxList<Student> generalAdmittedStudents = <Student>[].obs;

  final RxList<Student> allStudents = <Student>[].obs;

  void drawFqEligibleStudents({
    required int numberOfStudentsToBeAdmitted,
    required int percentageOfFqQuota,
  }) {
    allStudents.addAll(homeController.students.value);
    int numberOfFqEligibleStudents = (numberOfStudentsToBeAdmitted * percentageOfFqQuota / 100).round();
    fqAdmittedStudents.value.clear();

    developer.log('All students length in FQ Start: ${allStudents.length}');
    allStudents.shuffle();
    for (int i = 0; i < allStudents.length; i++) {
      if (allStudents[i].isFq?.toLowerCase() == 'fq') {
        if (fqAdmittedStudents.length == numberOfFqEligibleStudents) {
          break;
        }
        fqAdmittedStudents.add(allStudents[i]);
      }
    }
    for (int i = 0; i < fqAdmittedStudents.length; i++) {
      allStudents.remove(fqAdmittedStudents[i]);
    }

    fqAdmittedStudents.sort((a, b) => a.roll!.compareTo(b.roll!));
  }

  void drawEqEligibleStudents({
    required int numberOfStudentsToBeAdmitted,
    required int percentageOfEqQuota,
  }) {
    eqAdmittedStudents.value.clear();
    developer.log('All students length in EQ: ${allStudents.length}');

    final numberOfEqEligibleStudents = (numberOfStudentsToBeAdmitted * percentageOfEqQuota / 100).round();
    developer.log('Number of EQ Eligible Students: $numberOfEqEligibleStudents');

    allStudents.shuffle();

    for (int i = 0; i < allStudents.length; i++) {
      if (allStudents[i].isEq?.toLowerCase() == 'eq') {
        if (eqAdmittedStudents.length == numberOfEqEligibleStudents) {
          break;
        }
        eqAdmittedStudents.add(allStudents[i]);
      }
    }
    for (int i = 0; i < eqAdmittedStudents.length; i++) {
      allStudents.remove(eqAdmittedStudents[i]);
    }
    eqAdmittedStudents.sort((a, b) => a.roll!.compareTo(b.roll!));
  }

  void drawCaqEligibleStudents({
    required int numberOfStudentsToBeAdmitted,
    required int percentageOfCaqQuota,
  }) {
    caqAdmittedStudents.value.clear();
    developer.log('All students length in CAQ: ${allStudents.length}');
    final numberOfCaqEligibleStudents = (numberOfStudentsToBeAdmitted * percentageOfCaqQuota / 100).round();
    allStudents.shuffle();
    for (int i = 0; i < allStudents.length; i++) {
      if (allStudents[i].isCaq?.toLowerCase() == 'yes') {
        if (caqAdmittedStudents.length == numberOfCaqEligibleStudents) {
          break;
        }
        caqAdmittedStudents.add(allStudents[i]);
      }
    }
    for (int i = 0; i < caqAdmittedStudents.length; i++) {
      allStudents.remove(caqAdmittedStudents[i]);
    }
    caqAdmittedStudents.sort((a, b) => a.roll!.compareTo(b.roll!));
  }

  void drawSiblingEligibleStudents({
    required int numberOfStudentsToBeAdmitted,
    required int percentageOfSiblingQuota,
  }) {
    siblingAdmittedStudents.value.clear();
    developer.log('All students length in Sibling: ${allStudents.length}');
    final numberOfSiblingEligibleStudents = (numberOfStudentsToBeAdmitted * percentageOfSiblingQuota / 100).round();
    allStudents.shuffle();
    for (int i = 0; i < allStudents.length; i++) {
      if (allStudents[i].isSibling?.toLowerCase() == 'yes') {
        if (siblingAdmittedStudents.length == numberOfSiblingEligibleStudents) {
          break;
        }
        siblingAdmittedStudents.add(allStudents[i]);
      }
    }
    for (int i = 0; i < siblingAdmittedStudents.length; i++) {
      allStudents.remove(siblingAdmittedStudents[i]);
    }
    siblingAdmittedStudents.sort((a, b) => a.roll!.compareTo(b.roll!));
  }

  void drawGeneralStudents({
    required int numberOfStudentsToBeAdmitted,
    required int percentageOfSiblingQuota,
  }) {
    generalAdmittedStudents.value.clear();
    developer.log('All students length in General: ${allStudents.length}');
    final numberOfGeneralEligibleStudents = (numberOfStudentsToBeAdmitted * percentageOfSiblingQuota / 100).round();
    allStudents.shuffle();
    for (int i = 0; i < allStudents.length; i++) {
      if (generalAdmittedStudents.length == numberOfGeneralEligibleStudents) {
        break;
      }
      generalAdmittedStudents.add(allStudents[i]);
    }
    for (int i = 0; i < generalAdmittedStudents.length; i++) {
      allStudents.remove(generalAdmittedStudents[i]);
    }
    generalAdmittedStudents.sort((a, b) => a.roll!.compareTo(b.roll!));
    developer.log('Left over students length in General: ${allStudents.length}');
  }
}

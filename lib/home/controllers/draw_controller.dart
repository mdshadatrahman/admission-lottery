// ignore_for_file: invalid_use_of_protected_member

import 'package:admission_lottery/home/controllers/home_controller.dart';
import 'package:admission_lottery/models/student_model.dart';
import 'package:get/instance_manager.dart';
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
  final RxList<Student> generalAdmittedStudents = <Student>[].obs;

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

  void drawCaqEligibleStudents({
    required int numberOfStudentsToBeAdmitted,
    required int percentageOfCaqQuota,
  }) {
    caqAdmittedStudents.value.clear();
    final List<Student> caqEligibleUpdatedStudents = <Student>[];
    caqEligibleUpdatedStudents.addAll(_caqEligibleStudents);
    // If the remaining fq students has caq quota, then they will be admitted first
    for (int i = 0; i < _fqEligibleStudents.length; i++) {
      if (_fqEligibleStudents[i].isCaq?.toLowerCase() == 'caq' && !fqAdmittedStudents.contains(_fqEligibleStudents[i]) && !eqAdmittedStudents.contains(_fqEligibleStudents[i])) {
        if (caqEligibleUpdatedStudents.contains(_fqEligibleStudents[i])) {
          caqEligibleUpdatedStudents.remove(_fqEligibleStudents[i]);
        }
        caqEligibleUpdatedStudents.add(_fqEligibleStudents[i]);
      }
    }

    // If the remaining eq students has caq quota, then they will be admitted first
    for (int i = 0; i < _eqEligibleStudents.length; i++) {
      if (_eqEligibleStudents[i].isCaq?.toLowerCase() == 'caq' && !eqAdmittedStudents.contains(_eqEligibleStudents[i])) {
        if (caqEligibleUpdatedStudents.contains(_eqEligibleStudents[i])) {
          caqEligibleUpdatedStudents.remove(_eqEligibleStudents[i]);
        }
        caqEligibleUpdatedStudents.add(_eqEligibleStudents[i]);
      }
    }

    caqEligibleUpdatedStudents.shuffle();
    int numberOfCaqEligibleStudents = (numberOfStudentsToBeAdmitted * percentageOfCaqQuota / 100).round();
    for (int i = 0; i < numberOfCaqEligibleStudents; i++) {
      caqAdmittedStudents.add(caqEligibleUpdatedStudents[i]);
    }
  }

  void drawSiblingEligibleStudents({
    required int numberOfStudentsToBeAdmitted,
    required int percentageOfSiblingQuota,
  }) {
    siblingAdmittedStudents.value.clear();
    final List<Student> siblingEligibleUpdatedStudents = <Student>[];
    siblingEligibleUpdatedStudents.addAll(_siblingEligibleStudents);
    // If the remaining fq students has caq quota, then they will be admitted first
    for (int i = 0; i < _fqEligibleStudents.length; i++) {
      if (_fqEligibleStudents[i].isSibling?.toLowerCase() == 'sibling' &&
          !fqAdmittedStudents.contains(_fqEligibleStudents[i]) &&
          !eqAdmittedStudents.contains(_fqEligibleStudents[i]) &&
          !caqAdmittedStudents.contains(_fqEligibleStudents[i])) {
        if (siblingEligibleUpdatedStudents.contains(_fqEligibleStudents[i])) {
          siblingEligibleUpdatedStudents.remove(_fqEligibleStudents[i]);
        }
        siblingEligibleUpdatedStudents.add(_fqEligibleStudents[i]);
      }
    }

    // If the remaining eq students has caq quota, then they will be admitted first
    for (int i = 0; i < _eqEligibleStudents.length; i++) {
      if (_eqEligibleStudents[i].isSibling?.toLowerCase() == 'sibling' && !eqAdmittedStudents.contains(_eqEligibleStudents[i]) && !caqAdmittedStudents.contains(_eqEligibleStudents[i])) {
        if (siblingEligibleUpdatedStudents.contains(_eqEligibleStudents[i])) {
          siblingEligibleUpdatedStudents.remove(_eqEligibleStudents[i]);
        }
        siblingEligibleUpdatedStudents.add(_eqEligibleStudents[i]);
      }
    }

    // If the remaining caq students has caq quota, then they will be admitted first
    for (int i = 0; i < _caqEligibleStudents.length; i++) {
      if (_caqEligibleStudents[i].isSibling?.toLowerCase() == 'sibling' && !caqAdmittedStudents.contains(_caqEligibleStudents[i])) {
        if (siblingEligibleUpdatedStudents.contains(_caqEligibleStudents[i])) {
          siblingEligibleUpdatedStudents.remove(_caqEligibleStudents[i]);
        }
        siblingEligibleUpdatedStudents.add(_caqEligibleStudents[i]);
      }
    }

    siblingEligibleUpdatedStudents.shuffle();
    int numberOfSiblingEligibleStudents = (numberOfStudentsToBeAdmitted * percentageOfSiblingQuota / 100).round();
    for (int i = 0; i < numberOfSiblingEligibleStudents; i++) {
      siblingAdmittedStudents.add(siblingEligibleUpdatedStudents[i]);
    }
  }

  void drawGeneralStudents({
    required int numberOfStudentsToBeAdmitted,
    required int percentageOfSiblingQuota,
  }) {
    generalAdmittedStudents.value.clear();
    final generalEligibleUpdatedStudents = <Student>[];
    final allStudents = homeController.students.value;
    for (int i = 0; i < allStudents.length; i++) {
      if (!fqAdmittedStudents.contains(allStudents[i]) &&
          !eqAdmittedStudents.contains(allStudents[i]) &&
          !caqAdmittedStudents.contains(allStudents[i]) &&
          !siblingAdmittedStudents.contains(allStudents[i])) {
        generalEligibleUpdatedStudents.add(allStudents[i]);
      }
    }
    generalEligibleUpdatedStudents.shuffle();
    int numberOfGeneralEligibleStudents = (numberOfStudentsToBeAdmitted * percentageOfSiblingQuota / 100).round();
    for (int i = 0; i < numberOfGeneralEligibleStudents; i++) {
      generalAdmittedStudents.add(generalEligibleUpdatedStudents[i]);
    }
  }
}

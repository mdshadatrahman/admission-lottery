import 'package:admission_lottery/models/student_model.dart';

class QuotaEligibleStudentsController {
  static List<Student> getFqOrEqEligibleStudents({
    required List<Student> students,
  }) {
    if (students.isEmpty) return [];
    List<Student> fqEligibleStudents = [];
    for (int i = 0; i < students.length; i++) {
      if (students[i].isFq?.toLowerCase().trim() == 'yes') {
        fqEligibleStudents.add(students[i]);
      }
    }
    return fqEligibleStudents;
  }

  static List<Student> getEqEligibleStudents({
    required List<Student> students,
  }) {
    if (students.isEmpty) return [];
    List<Student> eqEligibleStudents = [];
    for (int i = 0; i < students.length; i++) {
      if (students[i].isEq?.toLowerCase().trim() == 'yes') {
        eqEligibleStudents.add(students[i]);
      }
    }
    return eqEligibleStudents;
  }

  static List<Student> getCaqEligibleStudents({
    required List<Student> students,
  }) {
    if (students.isEmpty) return [];
    List<Student> caqEligibleStudents = [];
    for (int i = 0; i < students.length; i++) {
      if (students[i].isCaq?.toLowerCase().trim() == 'yes') {
        caqEligibleStudents.add(students[i]);
      }
    }
    return caqEligibleStudents;
  }

  static List<Student> getSiblingEligibleStudents({
    required List<Student> students,
  }) {
    if (students.isEmpty) return [];
    List<Student> siblingEligibleStudents = [];
    for (int i = 0; i < students.length; i++) {
      if (students[i].isSibling?.toLowerCase().trim() == 'yes') {
        siblingEligibleStudents.add(students[i]);
      }
    }
    return siblingEligibleStudents;
  }

  static List<Student> getTwinEligibleStudents({
    required List<Student> students,
  }) {
    if (students.isEmpty) return [];
    List<Student> twinEligibleStudents = [];
    for (int i = 0; i < students.length; i++) {
      if (students[i].isTwin?.toLowerCase().trim() == 'yes') {
        twinEligibleStudents.add(students[i]);
      }
    }
    return twinEligibleStudents;
  }

  static List<Student> getLillahBoardingEligibleStudents({
    required List<Student> students,
  }) {
    if (students.isEmpty) return [];
    List<Student> lillahBoardingEligibleStudents = [];
    for (int i = 0; i < students.length; i++) {
      if (students[i].isLillahBoarding?.toLowerCase().trim() == 'yes') {
        lillahBoardingEligibleStudents.add(students[i]);
      }
    }
    return lillahBoardingEligibleStudents;
  }

  static List<Student> getDisabilityEligibleStudents({
    required List<Student> students,
  }) {
    if (students.isEmpty) return [];
    List<Student> disabilityEligibleStudents = [];
    for (int i = 0; i < students.length; i++) {
      if (students[i].isDisablity?.toLowerCase().trim() == 'yes') {
        disabilityEligibleStudents.add(students[i]);
      }
    }
    return disabilityEligibleStudents;
  }
}

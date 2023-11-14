import 'package:admission_lottery/models/student_model.dart';

class QuotaEligibleStudentsController {
  static List<Student> getFqOrEqEligibleStudents({
    required List<Student> students,
  }) {
    if (students.isEmpty) return [];
    List<Student> fqEligibleStudents = [];
    for (int i = 0; i < students.length; i++) {
      if (students[i].isFqOrEq?.toLowerCase() == 'fq' || students[i].isFqOrEq?.toLowerCase() == 'eq') {
        fqEligibleStudents.add(students[i]);
      }
    }
    return fqEligibleStudents;
  }

  // static List<Student> getEqEligibleStudents({
  //   required List<Student> students,
  // }) {
  //   if (students.isEmpty) return [];
  //   List<Student> eqEligibleStudents = [];
  //   for (int i = 0; i < students.length; i++) {
  //     if (students[i].isEq?.toLowerCase() == 'eq') {
  //       eqEligibleStudents.add(students[i]);
  //     }
  //   }
  //   return eqEligibleStudents;
  // }

  static List<Student> getCaqEligibleStudents({
    required List<Student> students,
  }) {
    if (students.isEmpty) return [];
    List<Student> caqEligibleStudents = [];
    for (int i = 0; i < students.length; i++) {
      if (students[i].isCaq?.toLowerCase() == 'yes') {
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
      if (students[i].isSibling?.toLowerCase() == 'yes') {
        siblingEligibleStudents.add(students[i]);
      }
    }
    return siblingEligibleStudents;
  }
}

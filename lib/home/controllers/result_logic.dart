import 'dart:math';
import 'dart:developer' as developer show log;
import 'package:admission_lottery/models/student_model.dart';

class ResultLogic {
  // if FQ == FQ count
  static List<Student> getFq({
    required List<Student> students,
    required double eligiblePercentage,
  }) {
    if (students.isEmpty) return [];
    final newStudnets = students.where((element) => element.isFq?.toLowerCase() == 'fq').toList();

    final numberOfEligibleStudents = (students.length * eligiblePercentage / 100).round();
    final eligibleStudents = <Student>[];
    final randomIndexes = <int>[];
    for (int i = 0; i < numberOfEligibleStudents; i++) {
      final randomIndex = Random().nextInt(newStudnets.length);
      if (!randomIndexes.contains(randomIndex)) {
        randomIndexes.add(randomIndex);
        eligibleStudents.add(newStudnets[randomIndex]);
      }
    }
    developer.log('NumberOfEligibleStudents: $numberOfEligibleStudents', name: 'ResultLogic.getFq');
    developer.log('randomIndexes: $randomIndexes', name: 'ResultLogic.getFq');
    return eligibleStudents;
  }
}

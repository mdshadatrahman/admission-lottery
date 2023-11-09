import 'package:admission_lottery/models/student_model.dart';

class ResultLogic {
  // if FQ == FQ count
  static List<Student> getFq(List<Student> students) {
    if (students.isEmpty) return [];
    return students.where((element) => element.isFq?.toLowerCase() == 'fq').toList();
  }
}

import 'package:admission_lottery/models/student_model.dart';
import 'package:admission_lottery/utils/app_colors.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RightPart extends StatelessWidget {
  const RightPart({
    super.key,
    required this.students,
  });

  final List<Student> students;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: students.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                SizedBox(
                  width: 50.w,
                  child: Text(
                    students[index].sl.toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 150.w,
                  child: Text(
                    students[index].roll.toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 50.w,
                  child: Text(
                    students[index].isFq.toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 50.w,
                  child: Text(
                    students[index].isEq.toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 70.w,
                  child: Text(
                    students[index].isCaq.toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 130.w,
                  child: Text(
                    students[index].isSibling.toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 130.w,
                  child: Text(
                    students[index].isGeneral.toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

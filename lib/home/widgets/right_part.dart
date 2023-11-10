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
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            color: AppColors.tertiary,
            child: Row(
              children: [
                SizedBox(
                  width: 50.w,
                  child: Text(
                    'SL',
                    style: titleStyle(),
                  ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 150.w,
                  child: Text(
                    'Roll',
                    style: titleStyle(),
                  ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 50.w,
                  child: Text(
                    'FQ',
                    style: titleStyle(),
                  ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 50.w,
                  child: Text(
                    'EQ',
                    style: titleStyle(),
                  ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 70.w,
                  child: Text(
                    'CAQ',
                    style: titleStyle(),
                  ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 130.w,
                  child: Text(
                    'Sibling',
                    style: titleStyle(),
                  ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 130.w,
                  child: Text(
                    'General',
                    style: titleStyle(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: students.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  color: index % 2 == 0 ? AppColors.background : AppColors.outlineVariant,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 50.w,
                        child: Text(
                          students[index].sl.toString(),
                          style: bodyStyle(index),
                        ),
                      ),
                      const SizedBox(width: 20),
                      SizedBox(
                        width: 150.w,
                        child: Text(
                          students[index].roll.toString(),
                          style: bodyStyle(index),
                        ),
                      ),
                      const SizedBox(width: 20),
                      SizedBox(
                        width: 50.w,
                        child: Text(
                          students[index].isFq.toString(),
                          style: bodyStyle(index),
                        ),
                      ),
                      const SizedBox(width: 20),
                      SizedBox(
                        width: 50.w,
                        child: Text(
                          students[index].isEq.toString(),
                          style: bodyStyle(index),
                        ),
                      ),
                      const SizedBox(width: 20),
                      SizedBox(
                        width: 70.w,
                        child: Text(
                          students[index].isCaq.toString(),
                          style: bodyStyle(index),
                        ),
                      ),
                      const SizedBox(width: 20),
                      SizedBox(
                        width: 130.w,
                        child: Text(
                          students[index].isSibling.toString(),
                          style: bodyStyle(index),
                        ),
                      ),
                      const SizedBox(width: 20),
                      SizedBox(
                        width: 130.w,
                        child: Text(
                          students[index].isGeneral.toString(),
                          style: bodyStyle(index),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  TextStyle bodyStyle(int index) => TextStyle(fontSize: 20.sp, color: index % 2 == 0 ? AppColors.onBackground : AppColors.onBackground);

  TextStyle titleStyle() => TextStyle(fontSize: 20.sp, color: AppColors.onTertiary);
}

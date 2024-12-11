import 'package:admission_lottery/models/student_model.dart';
import 'package:admission_lottery/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RightPart extends StatelessWidget {
  const RightPart({
    super.key,
    required this.students,
    required this.isLoading,
  });

  final List<Student> students;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            )
          : SingleChildScrollView(
              child: Table(
                border: TableBorder.all(color: AppColors.tertiary),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                defaultColumnWidth: const IntrinsicColumnWidth(),
                children: [
                  TableRow(
                    decoration: BoxDecoration(
                      color: AppColors.tertiary,
                    ),
                    children: [
                      const TableCell(
                        child: Center(
                          child: Text(
                            'SL',
                            style: TextStyle(
                              color: AppColors.onPrimary,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      const TableCell(
                        child: Center(
                          child: Text(
                            'Roll',
                            style: TextStyle(
                              color: AppColors.onPrimary,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      const TableCell(
                        child: Center(
                          child: Text(
                            'FQ',
                            style: TextStyle(
                              color: AppColors.onPrimary,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      const TableCell(
                        child: Center(
                          child: Text(
                            'EQ',
                            style: TextStyle(
                              color: AppColors.onPrimary,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      const TableCell(
                        child: Center(
                          child: Text(
                            'CAQ',
                            style: TextStyle(
                              color: AppColors.onPrimary,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      const TableCell(
                        child: Center(
                          child: Text(
                            'Sibling',
                            style: TextStyle(
                              color: AppColors.onPrimary,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      const TableCell(
                        child: Center(
                          child: Text(
                            'Twin',
                            style: TextStyle(
                              color: AppColors.onPrimary,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      const TableCell(
                        child: Center(
                          child: Text(
                            'Liilah Boarding',
                            style: TextStyle(
                              color: AppColors.onPrimary,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      const TableCell(
                        child: Center(
                          child: Text(
                            'Disablity',
                            style: TextStyle(
                              color: AppColors.onPrimary,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      const TableCell(
                        child: Center(
                          child: Text(
                            'General',
                            style: TextStyle(
                              color: AppColors.onPrimary,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  for (var student in students)
                    TableRow(
                      decoration: BoxDecoration(
                        color: students.indexOf(student) % 2 == 0 ? AppColors.background : AppColors.outlineVariant,
                      ),
                      children: [
                        TableCell(
                          child: Center(
                            child: Text(
                              student.sl.toString(),
                              style: TextStyle(
                                color: AppColors.onBackground,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text(
                              student.roll.toString(),
                              style: TextStyle(
                                color: AppColors.onBackground,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text(
                              student.isFq.toString(),
                              style: TextStyle(
                                color: AppColors.onBackground,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text(
                              student.isEq.toString(),
                              style: TextStyle(
                                color: AppColors.onBackground,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text(
                              student.isCaq.toString(),
                              style: TextStyle(
                                color: AppColors.onBackground,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text(
                              student.isSibling.toString(),
                              style: TextStyle(
                                color: AppColors.onBackground,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text(
                              student.isTwin.toString(),
                              style: TextStyle(
                                color: AppColors.onBackground,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text(
                              student.isLillahBoarding.toString(),
                              style: TextStyle(
                                color: AppColors.onBackground,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text(
                              student.isDisablity.toString(),
                              style: TextStyle(
                                color: AppColors.onBackground,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text(
                              student.isGeneral.toString(),
                              style: TextStyle(
                                color: AppColors.onBackground,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
    );
  }

  TextStyle bodyStyle(int index) => TextStyle(fontSize: 20.sp, color: index % 2 == 0 ? AppColors.onBackground : AppColors.onBackground);

  TextStyle titleStyle() => TextStyle(fontSize: 20.sp, color: AppColors.onTertiary);
}

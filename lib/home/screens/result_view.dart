import 'package:admission_lottery/home/controllers/draw_controller.dart';
import 'package:admission_lottery/main.dart';
import 'package:admission_lottery/utils/app_colors.dart';
import 'package:fluent_ui/fluent_ui.dart' as f;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/instance_manager.dart';

class ResultView extends StatefulWidget {
  const ResultView({super.key});

  @override
  State<ResultView> createState() => _RestulViewState();
}

class _RestulViewState extends State<ResultView> {
  final drawcontroller = Get.put(DrawController());
  @override
  //TODO Add loading state
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primary,
        title: const Text('Result'),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.sp),
        child: SizedBox(
          height: height,
          width: width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Freedom Fighter Quota: (${drawcontroller.fqAdmittedStudents.length})',
                          style: TextStyle(
                            fontSize: 20.sp,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Column(
                          children: [
                            for (int i = 0; i < drawcontroller.fqAdmittedStudents.length; i++)
                              f.Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text(
                                  drawcontroller.fqAdmittedStudents[i].roll.toString(),
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(width: 50.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Education Quota:(${drawcontroller.eqAdmittedStudents.length})',
                          style: TextStyle(
                            fontSize: 20.sp,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Column(
                          children: [
                            for (int i = 0; i < drawcontroller.eqAdmittedStudents.length; i++)
                              f.Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text(
                                  drawcontroller.eqAdmittedStudents[i].roll.toString(),
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(width: 50.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Catchment Area Quota:(${drawcontroller.caqAdmittedStudents.length})',
                          style: TextStyle(
                            fontSize: 20.sp,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Column(
                          children: [
                            for (int i = 0; i < drawcontroller.caqAdmittedStudents.length; i++)
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text(
                                  drawcontroller.caqAdmittedStudents[i].roll.toString(),
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(width: 50.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Sibling Quota:(${drawcontroller.siblingAdmittedStudents.length})',
                          style: TextStyle(
                            fontSize: 20.sp,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Column(
                          children: [
                            for (int i = 0; i < drawcontroller.siblingAdmittedStudents.length; i++)
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text(
                                  drawcontroller.siblingAdmittedStudents[i].roll.toString(),
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(width: 50.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'General Quota: ${drawcontroller.generalAdmittedStudents.length}',
                          style: TextStyle(
                            fontSize: 20.sp,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Column(
                          children: [
                            for (int i = 0; i < drawcontroller.generalAdmittedStudents.length; i++)
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text(
                                  drawcontroller.generalAdmittedStudents[i].roll.toString(),
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

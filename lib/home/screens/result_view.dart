import 'package:admission_lottery/home/controllers/draw_controller.dart';
import 'package:admission_lottery/main.dart';
import 'package:admission_lottery/utils/app_colors.dart';
import 'package:cross_scroll/cross_scroll.dart';
import 'package:fluent_ui/fluent_ui.dart' as f;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class ResultView extends StatefulWidget {
  const ResultView({super.key});

  @override
  State<ResultView> createState() => _RestulViewState();
}

class _RestulViewState extends State<ResultView> {
  final drawcontroller = Get.put(DrawController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primary,
        title: const Text(
          'Result',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
            drawcontroller.dispose();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: () {
              drawcontroller.createExcel(context);
              drawcontroller.generatePdf(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.sp),
        child: SizedBox(
          height: height,
          width: width,
          child: CrossScroll(
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
                          'Twin Quota:(${drawcontroller.twinAdmittedStudents.length})',
                          style: TextStyle(
                            fontSize: 20.sp,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Column(
                          children: [
                            for (int i = 0; i < drawcontroller.twinAdmittedStudents.length; i++)
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text(
                                  drawcontroller.twinAdmittedStudents[i].roll.toString(),
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
                          'Lillah Boarding Quota:(${drawcontroller.lillahBoardingAdmittedStudents.length})',
                          style: TextStyle(
                            fontSize: 20.sp,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Column(
                          children: [
                            for (int i = 0; i < drawcontroller.lillahBoardingAdmittedStudents.length; i++)
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text(
                                  drawcontroller.lillahBoardingAdmittedStudents[i].roll.toString(),
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
                          'Disability Quota:(${drawcontroller.disabilityAdmittedStudents.length})',
                          style: TextStyle(
                            fontSize: 20.sp,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Column(
                          children: [
                            for (int i = 0; i < drawcontroller.disabilityAdmittedStudents.length; i++)
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text(
                                  drawcontroller.disabilityAdmittedStudents[i].roll.toString(),
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
                          'General Quota: (${drawcontroller.generalAdmittedStudents.length})',
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

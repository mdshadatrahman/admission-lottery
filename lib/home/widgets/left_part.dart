// ignore_for_file: invalid_use_of_protected_member

import 'package:admission_lottery/home/controllers/draw_controller.dart';
import 'package:admission_lottery/home/controllers/home_controller.dart';
import 'package:admission_lottery/home/widgets/textfield_with_label.dart';
import 'package:admission_lottery/main.dart';
import 'package:admission_lottery/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'dart:developer' as developer show log;

GlobalKey<FormState> formKey = GlobalKey<FormState>();

class LeftPart extends StatefulWidget {
  const LeftPart({
    super.key,
  });

  @override
  State<LeftPart> createState() => _LeftPartState();
}

class _LeftPartState extends State<LeftPart> {
  final controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    controller.readDataFromExcelSheet();
    studentToBeAdmittedController.text = '100';
    freedomFighterQuotaController.text = '5';
    educationQuotaController.text = '2';
    catchmentAreaQuotaController.text = '40';
    siblingQuotaController.text = '5';
  }

  final studentToBeAdmittedController = TextEditingController();
  final freedomFighterQuotaController = TextEditingController();
  final educationQuotaController = TextEditingController();
  final catchmentAreaQuotaController = TextEditingController();
  final siblingQuotaController = TextEditingController();

  @override
  void dispose() {
    studentToBeAdmittedController.dispose();
    freedomFighterQuotaController.dispose();
    educationQuotaController.dispose();
    catchmentAreaQuotaController.dispose();
    siblingQuotaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: width,
      height: height,
      color: AppColors.tertiaryContainer,
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Class:',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.onTertiaryContainer,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Obx(
                    () => DropdownButton(
                      value: controller.selectedClass.value,
                      underline: const SizedBox(),
                      items: [
                        DropdownMenuItem(
                          value: 3,
                          child: Text('3', style: TextStyle(fontSize: 20.sp)),
                        ),
                        DropdownMenuItem(
                          value: 6,
                          child: Text('6', style: TextStyle(fontSize: 20.sp)),
                        ),
                        DropdownMenuItem(
                          value: 9,
                          child: Text('9', style: TextStyle(fontSize: 20.sp)),
                        ),
                      ],
                      onChanged: (v) {
                        controller.selectedClass.value = v as int;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Text(
                    'Version:',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.onTertiaryContainer,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Obx(
                    () => DropdownButton(
                      value: controller.version.value,
                      underline: const SizedBox(),
                      items: [
                        DropdownMenuItem(
                          value: 'English',
                          child: Text('English', style: TextStyle(fontSize: 20.sp)),
                        ),
                        DropdownMenuItem(
                          value: 'Bangla',
                          child: Text('Bangla', style: TextStyle(fontSize: 20.sp)),
                        ),
                      ],
                      onChanged: (v) {
                        controller.version.value = v as String;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Text(
                    'Shift:',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.onTertiaryContainer,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Obx(
                    () => DropdownButton(
                      value: controller.shift.value,
                      underline: const SizedBox(),
                      items: [
                        DropdownMenuItem(
                          value: 'Morning',
                          child: Text('Morning', style: TextStyle(fontSize: 20.sp)),
                        ),
                        DropdownMenuItem(
                          value: 'Day',
                          child: Text('Day', style: TextStyle(fontSize: 20.sp)),
                        ),
                      ],
                      onChanged: (v) {
                        controller.shift.value = v as String;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              TextFieldWithLabel(
                controller: studentToBeAdmittedController,
                label: 'Students to be admitted:',
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return 'Please enter a value';
                  }
                  if (int.tryParse(v) == null) {
                    return 'Please enter a valid number';
                  }
                  if (int.parse(v) < 0) {
                    return 'Please enter a positive number';
                  }
                  if (int.parse(v) > controller.students.length) {
                    return 'Can not be more than ${controller.students.length}';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.h),
              TextFieldWithLabel(
                controller: freedomFighterQuotaController,
                label: 'Freedom Fighter Quota(%):',
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return 'Please enter a value';
                  }
                  if (int.tryParse(v) == null) {
                    return 'Please enter a valid number';
                  }
                  if (int.parse(v) > 100) {
                    return 'Please enter a value less than 100';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.h),
              TextFieldWithLabel(
                controller: educationQuotaController,
                label: 'Education Quota(%):',
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return 'Please enter a value';
                  }
                  if (int.tryParse(v) == null) {
                    return 'Please enter a valid number';
                  }
                  if (int.parse(v) > 100) {
                    return 'Please enter a value less than 100';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.h),
              TextFieldWithLabel(
                controller: catchmentAreaQuotaController,
                label: 'Catchment Area Quota(%):',
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return 'Please enter a value';
                  }
                  if (int.tryParse(v) == null) {
                    return 'Please enter a valid number';
                  }
                  if (int.parse(v) > 100) {
                    return 'Please enter a value less than 100';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.h),
              TextFieldWithLabel(
                controller: siblingQuotaController,
                label: 'Sibling Quota(%):',
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return 'Please enter a value';
                  }
                  if (int.tryParse(v) == null) {
                    return 'Please enter a valid number';
                  }
                  if (int.parse(v) > 100) {
                    return 'Please enter a value less than 100';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () {
                  if (!formKey.currentState!.validate()) {
                    return;
                  }
                  controller.filterStudents();
                  final drawController = Get.put(DrawController());
                  final int numberOfStudentsToBeAdmitted = int.tryParse(studentToBeAdmittedController.text) ?? 0;
                  final int percentageOfFqQuota = freedomFighterQuotaController.text.isEmpty ? 0 : int.tryParse(freedomFighterQuotaController.text) ?? 0;
                  final int percentageOfEqQuota = educationQuotaController.text.isEmpty ? 0 : int.tryParse(educationQuotaController.text) ?? 0;
                  final int percentageOfCaqQuota = catchmentAreaQuotaController.text.isEmpty ? 0 : int.tryParse(catchmentAreaQuotaController.text) ?? 0;
                  final int percentageOfSiblingQuota = siblingQuotaController.text.isEmpty ? 0 : int.tryParse(siblingQuotaController.text) ?? 0;
                  drawController.drawFqEligibleStudents(
                    numberOfStudentsToBeAdmitted: numberOfStudentsToBeAdmitted,
                    percentageOfFqQuota: percentageOfFqQuota,
                  );
                  drawController.drawEqEligibleStudents(
                    numberOfStudentsToBeAdmitted: numberOfStudentsToBeAdmitted,
                    percentageOfEqQuota: percentageOfEqQuota,
                  );
                  drawController.drawCaqEligibleStudents(
                    numberOfStudentsToBeAdmitted: numberOfStudentsToBeAdmitted,
                    percentageOfCaqQuota: percentageOfCaqQuota,
                  );
                  drawController.drawSiblingEligibleStudents(
                    numberOfStudentsToBeAdmitted: numberOfStudentsToBeAdmitted,
                    percentageOfSiblingQuota: percentageOfSiblingQuota,
                  );

                  final int generalQuota = numberOfStudentsToBeAdmitted -
                      drawController.fqAdmittedStudents.length -
                      drawController.eqAdmittedStudents.length -
                      drawController.caqAdmittedStudents.length -
                      drawController.siblingAdmittedStudents.length;
                  drawController.drawGeneralStudents(
                    numberOfStudentsToBeAdmitted: numberOfStudentsToBeAdmitted,
                    percentageOfSiblingQuota: generalQuota, // Bug
                  );

                  ///------------------ For debugging purpose only --------------------///

                  final fq = drawController.fqAdmittedStudents.length;
                  final eq = drawController.eqAdmittedStudents.length;
                  final caq = drawController.caqAdmittedStudents.length;
                  final sibling = drawController.siblingAdmittedStudents.length;
                  developer.log('*********************************');
                  developer.log('Student list in excel: ${controller.students.value.length}');
                  developer.log('FQ: $fq');
                  developer.log('EQ: $eq');
                  developer.log('CAQ: $caq');
                  developer.log('SIBLING: $sibling');
                  developer.log('GENERAL: $generalQuota');
                  developer.log('*********************************');
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10.sp),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Result',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.onPrimary,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

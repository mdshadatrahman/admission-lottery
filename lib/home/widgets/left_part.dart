import 'package:admission_lottery/home/controllers/home_controller.dart';
import 'package:admission_lottery/main.dart';
import 'package:admission_lottery/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: width,
      height: height,
      color: AppColors.tertiaryContainer,
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
          GestureDetector(
            onTap: () {
              controller.readDataFromExcelSheet();
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
    );
  }
}

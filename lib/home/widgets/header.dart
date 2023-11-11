import 'package:admission_lottery/home/controllers/home_controller.dart';
import 'package:admission_lottery/main.dart';
import 'package:admission_lottery/utils/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/instance_manager.dart';

class Header extends StatefulWidget {
  const Header({
    super.key,
  });

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 30.h,
        bottom: 20.h,
      ),
      width: width,
      decoration: const BoxDecoration(
        color: AppColors.primary,
      ),
      child: Center(
        child: Row(
          children: [
            const Spacer(),
            Text(
              'DRMC Admission System',
              style: TextStyle(
                color: AppColors.onPrimary,
                fontSize: 50.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.file_upload_sharp, color: Colors.white),
              onPressed: () {
                controller.pickFile();
              },
            ),
            SizedBox(width: 10.w),
          ],
        ),
      ),
    );
  }
}

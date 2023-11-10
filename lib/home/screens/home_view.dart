// ignore_for_file: invalid_use_of_protected_member

import 'package:admission_lottery/home/controllers/home_controller.dart';
import 'package:admission_lottery/home/widgets/header.dart';
import 'package:admission_lottery/home/widgets/left_part.dart';
import 'package:admission_lottery/home/widgets/right_part.dart';
import 'package:admission_lottery/main.dart';
import 'package:admission_lottery/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SizedBox(
        height: height,
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Header(),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(child: LeftPart()),
                  Expanded(
                    flex: 3,
                    child: Obx(
                      () => RightPart(students: controller.students.value),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

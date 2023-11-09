import 'package:admission_lottery/home/widgets/header.dart';
import 'package:admission_lottery/home/widgets/left_part.dart';
import 'package:admission_lottery/main.dart';
import 'package:admission_lottery/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
                  Expanded(
                    child: LeftPart(),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: AppColors.background,
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

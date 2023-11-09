import 'package:admission_lottery/main.dart';
import 'package:admission_lottery/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeftPart extends StatelessWidget {
  const LeftPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: width,
      height: height,
      color: AppColors.tertiaryContainer,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Class:',
            style: TextStyle(
              fontSize: 40.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.onTertiaryContainer,
            ),
          ),
          const Expanded(child: SizedBox()),
          DropdownButton(
            items: const [
              DropdownMenuItem(
                value: 3,
                child: Text('3'),
              ),
              DropdownMenuItem(
                value: 6,
                child: Text('6'),
              ),
              DropdownMenuItem(
                value: 9,
                child: Text('9'),
              ),
            ],
            onChanged: (v) {},
          ),
        ],
      ),
    );
  }
}

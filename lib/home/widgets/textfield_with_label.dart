import 'package:admission_lottery/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldWithLabel extends StatelessWidget {
  const TextFieldWithLabel({
    super.key,
    required this.label,
    required this.controller,
  });
  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.onTertiaryContainer,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: AppColors.onTertiaryContainer,
                ),
              ),
              fillColor: AppColors.secondaryContainer,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:admission_lottery/main.dart';
import 'package:admission_lottery/utils/app_colors.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

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
        child: Text(
          'DRMC Admission System',
          style: TextStyle(
            color: AppColors.onPrimary,
            fontSize: 50.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

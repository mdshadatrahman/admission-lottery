import 'package:admission_lottery/home/controllers/home_controller.dart';
import 'package:admission_lottery/utils/app_colors.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class RightPart extends StatefulWidget {
  const RightPart({
    super.key,
  });

  @override
  State<RightPart> createState() => _RightPartState();
}

class _RightPartState extends State<RightPart> {
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: Obx(
        () => ListView.builder(
          shrinkWrap: true,
          itemCount: controller.students.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  SizedBox(
                    width: 50.w,
                    child: Text(
                      controller.students[index].sl.toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    width: 150.w,
                    child: Text(
                      controller.students[index].roll.toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    width: 50.w,
                    child: Text(
                      controller.students[index].isFq.toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    width: 50.w,
                    child: Text(
                      controller.students[index].isEq.toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    width: 70.w,
                    child: Text(
                      controller.students[index].isCaq.toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    width: 130.w,
                    child: Text(
                      controller.students[index].isSibling.toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    width: 130.w,
                    child: Text(
                      controller.students[index].isGeneral.toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

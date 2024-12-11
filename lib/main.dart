import 'package:admission_lottery/home/screens/home_view.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

late double height;
late double width;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
      builder: (_, child) {
        return FluentApp(
          debugShowCheckedModeBanner: false,
          title: 'DRMC Admission System',
          
          themeMode: ThemeMode.light,
          theme: FluentThemeData(
            brightness: Brightness.light,
            visualDensity: VisualDensity.standard,
          ),
          home: child,
        );
      },
      child: const HomeView(),
    );
  }
}

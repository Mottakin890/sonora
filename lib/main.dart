import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonora/app.dart';
import 'package:sonora/global/utils/dependency_injection/dependency_injection.dart';

void main(List<String> args) async {
  await _init();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((
    _,
  ) {
    return runApp(
      const ScreenUtilInit(
        designSize: Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        child: Sonora(),
      ),
    );
  });
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
}

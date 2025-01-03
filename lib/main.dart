import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:misfit_assigment/profile_screen.dart';
import 'package:misfit_assigment/sample.dart';
import 'package:misfit_assigment/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 1331),
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            textTheme: TextTheme(
              headlineLarge: Styles.headerStyle,
              bodyMedium: Styles.bodyStyle,
              bodySmall: Styles.bodyStyle2,
              labelSmall: Styles.buttonStyle
            ),
          ),
          home: child,
        );
      },
      child: ProfileScreen(user: SampleData.user),
    );
  }
}

// ignore_for_file: unused_element, non_constant_identifier_names

import "dart:async";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:myapp_ftl/global_components/global_components.dart";
import "package:myapp_ftl/pages/home_page/home_page.dart";
import "package:myapp_ftl/pages/payment_page/payment_page.dart";
import "package:myapp_ftl/pages/profile_page/profile_page.dart";
import "package:myapp_ftl/pages/settings_page/settings_page.dart";
import "package:myapp_ftl/routes/routes.dart";

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    Zone.current.handleUncaughtError(details.exception, details.stack!);
  };

  runZonedGuarded(() {
    runApp(const MyApp());
  }, (error, stack) {
    print('Unhandled error: $error');
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'IndexPage',
        routes: routes,
      ),
    );
  }
}

class PositionIndex extends StatefulWidget {
  const PositionIndex({super.key});

  @override
  State<PositionIndex> createState() => _PositionIndexState();
}

class _PositionIndexState extends State<PositionIndex> {
  int selectedIndex = 0;

  void _CallBak(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const HomePage(),
    const ProfilePage(),
    const PaymentPage(),
    const SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          buildFooterM3(context, i: selectedIndex, callbak: _CallBak),
      body: IndexedStack(
        index: selectedIndex,
        children: _pages,
      ),
    );
  }
}

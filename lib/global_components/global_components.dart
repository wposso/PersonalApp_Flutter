// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:google_fonts/google_fonts.dart";

Widget BottomNavigationBarFooter(
  BuildContext context,
) {
  return BottomNavigationBar(items: const [
    BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
    BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
    BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
  ]);
}

Widget buildFooterM3(BuildContext context,
    {required int i, required Function(int) callbak}) {
  return NavigationBar(
      onDestinationSelected: callbak,
      selectedIndex: i,
      shadowColor: const Color.fromARGB(255, 232, 222, 248),
      backgroundColor: Colors.white,
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
        NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        NavigationDestination(icon: Icon(Icons.payment), label: 'Payment'),
        NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
      ]);
}

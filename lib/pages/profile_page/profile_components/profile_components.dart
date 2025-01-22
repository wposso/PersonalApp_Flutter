import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildContainer(IconData icon) {
  return Container(
    padding: EdgeInsets.all(8.r),
    decoration: BoxDecoration(
        color: Colors.indigo,
        shape: BoxShape.circle,
        border: Border.all(width: 2, color: Colors.white)),
    child: Icon(
      icon,
      color: Colors.white,
    ),
  );
}

Widget buildListtileA(IconData? iconleading, String? title, String? subtitle,
    Widget? widgetbuild) {
  return ListTile(
    leading: Icon(iconleading),
    title: Text(
      title ?? '',
      style: GoogleFonts.poppins(),
    ),
    subtitle: Text(
      subtitle ?? '',
      style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 15.sp),
    ),
    trailing: widgetbuild,
  );
}

Widget buildListtileB(
    IconData? iconleading, String? title, Widget? widgetbuild) {
  return ListTile(
    leading: Icon(iconleading),
    title: Text(
      title ?? '',
      style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 15.sp),
    ),
    trailing: widgetbuild,
  );
}

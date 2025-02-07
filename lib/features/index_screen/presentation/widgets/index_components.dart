// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

bool isBack = false;

var headerLogo = Column(
  children: [
    Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.all(20.r),
        child: Center(
          child: Icon(
            Icons.vpn_key_sharp,
            color: const Color.fromRGBO(13, 71, 161, 1),
            size: 90.0.r,
          ),
        ),
      ),
    ),
    SizedBox(
      height: 10.0.r,
    ),
    Text(
      'Welcome Back',
      style: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 30.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  ],
);

var textInfo = Column(
  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Manage your expenses',
          style: GoogleFonts.poppins(fontSize: 14.0.sp, color: Colors.white),
        ),
      ],
    ),
    SizedBox(
      height: 10.0.h,
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'seamlessly & intuitively',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 17.0.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    )
  ],
);

Widget builderButton(String message, Color backcolor, Color forecolor,
    Color bordercolor, IconData? icon, VoidCallback? navigate) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0.r),
        side: BorderSide(color: bordercolor, width: 2.0.r),
      ),
      fixedSize: Size(300.0.w, 50.0.h),
      backgroundColor: backcolor,
      foregroundColor: forecolor,
    ),
    onPressed: navigate,
    child: Row(
      children: [
        Icon(icon, size: 24.r),
        SizedBox(
          width: 30.0.w,
        ),
        Text(
          message,
          style: GoogleFonts.poppins(fontSize: 16.0.sp),
        ),
      ],
    ),
  );
}

Widget textFooter(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'Already have an account?',
        style:
            GoogleFonts.poppins(color: Color.fromARGB(255, 146, 190, 234), fontSize: 14.sp),
      ),
      TextButton(
        onPressed: () {
          isBack = true;
          Navigator.pushNamed(context, '/LoginScreen', arguments: true);
        },
        child: Text(
          'Sign in',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 14.sp,
          ),
        ),
      )
    ],
  );
}

var iconExit = Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    IconButton(
      onPressed: () {
        void closeApp() {
          SystemNavigator.pop();
        }
      },
      icon: Icon(
        Icons.exit_to_app,
        color: Colors.white,
        size: 30.0.r,
      ),
    ),
  ],
);

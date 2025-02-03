import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Widget textIndicator(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 25.r,
          )),
      SizedBox(width: MediaQuery.of(context).size.width * 0.2),
      Text(
        'Settings',
        style:
            GoogleFonts.poppins(fontSize: 18.sp, fontWeight: FontWeight.bold),
      )
    ],
  );
}

Widget buildListTile(IconData leading, String message) {
  return ListTile(
    leading: Icon(leading),
    title: Text(message),
    trailing: const Icon(Icons.arrow_forward_ios_rounded),
  );
}

// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    elevation: 5,
    backgroundColor: Colors.blue[900],
    title: Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_active),
          color: Colors.white,
        ),
      ],
    ),
    centerTitle: true,
  );
}

var textHello = Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Text(
      'Hi Willinton',
      style: GoogleFonts.poppins(fontSize: 19.sp, fontWeight: FontWeight.bold),
    ),
  ],
);

Widget buildSearchBar(BuildContext context) {
  return SearchBar(
    backgroundColor:
        WidgetStateProperty.all(const Color.fromARGB(255, 247, 242, 250)),
    elevation: WidgetStateProperty.all(0),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
    ),
    padding: WidgetStateProperty.all(
      EdgeInsets.all(8.r),
    ),
    leading: const Icon(Icons.search),
    hintText: 'Search',
    hintStyle: WidgetStateProperty.all(GoogleFonts.poppins()),
  );
}

Widget buildCard(BuildContext context) {
  return Container(
    width: double.infinity,
    child: Card(
      elevation: 2,
      shadowColor: Colors.grey[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.r),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome!',
                  style: GoogleFonts.poppins(
                    color: Colors.blue[900],
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(
                  height: 10.r,
                ),
                Text(
                  "Let's schedule your\nprojects",
                  style: GoogleFonts.poppins(),
                ),
              ],
            ),
            const Spacer(),
            CircleAvatar(
              radius: 40.r,
              child: ClipOval(
                child: Image.asset(
                  'assets/image_profile.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

var textMiddle = Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Text(
      'Your space',
      style: GoogleFonts.poppins(
        color: Colors.blue[900],
        fontWeight: FontWeight.bold,
        fontSize: 18.sp,
      ),
    ),
    SizedBox(
      width: 10.r,
    ),
    const Icon(
      Icons.waving_hand_sharp,
      color: Colors.yellow,
    ),
  ],
);

Widget buildCardSpace(BuildContext context, String messageA, String messageB,
    Color color, double progress) {
  DateTime now = DateTime.now();
  String time = DateFormat('MMMM dd yyyy').format(now);
  return Container(
    width: 160.r,
    height: 160.r,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.r),
    ),
    child: Card(
      color: Colors.blue[900],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  time,
                  style:
                      GoogleFonts.poppins(fontSize: 12.sp, color: Colors.white),
                ),
                // const Spacer(),
                // Puedes habilitar el PopupMenuButton aquí si es necesario
                // PopupMenuButton(
                //     iconSize: 10.r,
                //     padding: EdgeInsets.zero,
                //     iconColor: Colors.white,
                //     itemBuilder: (context) => [
                //           const PopupMenuItem(child: Text('Download')),
                //           const PopupMenuItem(child: Text('Upload')),
                //           const PopupMenuItem(child: Text('Resend')),
                //         ])
              ],
            ),
            SizedBox(
              height: 10.r,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  messageA,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  messageB,
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              ],
            ),
            SizedBox(
              height: 15.r,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Progress',
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              ],
            ),
            SizedBox(
              height: 5.r,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                LinearPercentIndicator(
                  padding: EdgeInsets.zero,
                  barRadius: Radius.circular(30.r),
                  lineHeight: 6.r,
                  percent: progress,
                  progressColor: color,
                  width: 130.r,
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

void buildAlertDialog(BuildContext context, String title, Widget actionWidget,
    Widget contentWidget) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        actionsPadding: EdgeInsets.zero,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        title: Text(
          title,
          style: GoogleFonts.poppins(),
        ),
        content: contentWidget,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: actionWidget),
            ],
          )
        ],
      );
    },
  );
}

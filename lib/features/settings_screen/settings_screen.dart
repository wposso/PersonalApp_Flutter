import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp_ftl/features/settings_screen/presentation/widget/widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: const Size(375, 812), minTextAdapt: true);

    return Column(
      children: [
        Container(
          color: Colors.indigo,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.2,
          child: Padding(
            padding: EdgeInsets.all(20.r),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.canPop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 25.r,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10.r),
                    Text(
                      'Settings',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: EdgeInsets.all(15.r),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'General',
                        style: GoogleFonts.poppins(
                            fontSize: 16.sp, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  SizedBox(height: 20.r),
                  Column(
                    children: [
                      buildListTile(Icons.account_circle_outlined, 'Account'),
                      const Divider(),
                      SizedBox(height: 9.r),
                      buildListTile(Icons.notifications, 'Notification'),
                      const Divider(),
                      buildListTile(Icons.payment, 'Payment'),
                      const Divider(),
                      SizedBox(height: 9.r),
                      buildListTile(Icons.language, 'Language'),
                      const Divider(),
                      SizedBox(height: 9.r),
                      buildListTile(Icons.info_outline, 'Help'),
                      const Divider(),
                      SizedBox(height: 9.r),
                      buildListTile(Icons.exit_to_app, 'Logout'),
                      const Divider(),
                    ],
                  ),
                  SizedBox(
                    height: 20.r,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Feedback',
                        style: GoogleFonts.poppins(
                            fontSize: 16.sp, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  SizedBox(height: 20.r),
                  Column(
                    children: [
                      buildListTile(Icons.lock, 'Privacy'),
                      const Divider(),
                      SizedBox(height: 9.r),
                      buildListTile(Icons.feedback, 'Send feedback'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

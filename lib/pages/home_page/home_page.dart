// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';
import 'package:myapp_ftl/global_components/global_components.dart';
import 'package:myapp_ftl/pages/home_page/home_components/home_components.dart';
import 'package:myapp_ftl/pages/payment_page/payment_page.dart';
import 'package:myapp_ftl/pages/profile_page/profile_page.dart';
import 'package:myapp_ftl/pages/registration_page/registration_components/registration_components.dart';
import 'package:myapp_ftl/pages/settings_page/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: const Size(375, 812), minTextAdapt: true);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 15.r, left: 8.r, right: 8.r),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    buildAlertDialog(
                      context,
                      'Log Out',
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, 'LoginPage');
                              },
                              child: Text(
                                'Confirm',
                                style: GoogleFonts.poppins(),
                              )),
                          SizedBox(
                            width: 5.r,
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Cancel',
                                style: GoogleFonts.poppins(),
                              )),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.r),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Are you sure you want to log out? Any unsaved changes will be lost.',
                              style: GoogleFonts.poppins(),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.arrow_back_rounded),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_active),
                ),
              ],
            ),
            SizedBox(height: 30.r),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textHello,
                    SizedBox(height: 25.r),
                    buildSearchBar(context),
                    SizedBox(height: 25.r),
                    buildCard(context),
                    SizedBox(height: 25.r),
                    textMiddle,
                    SizedBox(height: 15.r),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  buildCardSpace(context, 'Dashboard',
                                      'message', Colors.green, 0.5),
                                  SizedBox(width: 10.r),
                                  buildCardSpace(context, 'Dashboard',
                                      'message', Colors.red, 0.10),
                                ],
                              ),
                              SizedBox(height: 10.r),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  buildCardSpace(context, 'Dashboard',
                                      'message', Colors.yellow, 0.50),
                                  SizedBox(width: 10.r),
                                  buildCardSpace(context, 'Dashboard',
                                      'message', Colors.blue, 0.80),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

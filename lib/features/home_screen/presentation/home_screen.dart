// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';
import 'package:myapp_ftl/core/utils/components/components.dart';
import 'package:myapp_ftl/features/home_screen/presentation/widgets/widgets.dart';
import 'package:myapp_ftl/features/login_screen/presentation/widgets/widgets.dart';
import 'package:myapp_ftl/features/login_screen/domain/login_controller/login_controller.dart';
import 'package:myapp_ftl/features/payment_screen/presentation/payment_screen.dart';
import 'package:myapp_ftl/features/profile_screen/profile_screen.dart';
import 'package:myapp_ftl/features/registration_screen/presentation/widgets/widgets.dart';
import 'package:myapp_ftl/features/settings_screen/settings_screen.dart';
import 'package:myapp_ftl/features/login_screen/data/service/login_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ObtenerUsuarios _obtenerUsuarios = ObtenerUsuarios();
  final Logout _logout = Logout();

  @override
  void initState() {
    getusers();
    super.initState();
  }

  Future<void> getusers() async {
    await _obtenerUsuarios.obtenerusuarios();
    setState(() {});
  }

  void logoutsucess() {
    int user = 0;

    for (var userfound in _obtenerUsuarios.listaUsuarios) {
      user = userfound['UserId'];
    }

    if (user == null) {
      debugPrint('No se ha encontrado ningún usuario');
    } else {
      _logout.logout(user).then((loggedsucces) {
        if (loggedsucces) {
          Navigator.pushReplacementNamed(context, 'LoginScreen');
          mostrarSnackBar(context, 'We hope to see you again soon!',
              const Color.fromRGBO(13, 71, 161, 1), Icons.info);
        }
      });
    }
  }

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
                                // Navigator.pushReplacementNamed(
                                //     context, 'LoginPage');
                                setState(() {
                                  logoutsucess();
                                });
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
                              buildHomeListTile(() {
                                Navigator.pushReplacementNamed(
                                    context, 'ContactsScreen');
                              }, Icons.people_alt_sharp, 'Manage Contacts',
                                  'Organize and update your contact list easily'),
                              SizedBox(
                                height: 10.r,
                              ),
                              buildHomeListTile(
                                  () {},
                                  Icons.image,
                                  'Manage Images',
                                  'View, organize, and update your image collection'),
                              SizedBox(
                                height: 10.r,
                              ),
                              buildHomeListTile(
                                  () {},
                                  Icons.calendar_month,
                                  'Manage Calendar',
                                  'Schedule, view, and update your events effortlessly'),
                              // SizedBox(
                              //   height: 10.r,
                              // ),
                              // buildHomeListTile(
                              //     Icons.image, 'Images', 'Manage your images'),
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

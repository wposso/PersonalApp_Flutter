// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp_ftl/pages/login_page/login_logic/login_logic.dart';
import 'package:myapp_ftl/pages/registration_page/registration_page.dart';
import 'package:myapp_ftl/services/login_service.dart';
import 'package:url_launcher/url_launcher.dart';

var email = TextEditingController();
var password = TextEditingController();

bool passwordVisible = true;
bool isActive = false;
bool isCheck = false;

void mostrarSnackBar(
    BuildContext context, String message, Color color, IconData icon) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: const Duration(seconds: 3),
    margin: EdgeInsets.all(15.0.r),
    behavior: SnackBarBehavior.floating,
    backgroundColor: color,
    content: Row(
      children: [
        Text(
          message,
          style: GoogleFonts.poppins(fontSize: 14.sp),
        ),
        const Spacer(),
        Icon(
          icon,
          color: Colors.white,
        ),
      ],
    ),
  ));
}

Widget mostrarDrawer() {
  return Drawer(
    child: Padding(
      padding: EdgeInsets.all(10.0.r),
      child: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favorite'),
            trailing: Icon(Icons.send),
          ),
        ],
      ),
    ),
  );
}

var headerContainer = Container(
  decoration: BoxDecoration(color: Colors.blue[900]),
  child: Padding(
    padding: EdgeInsets.only(left: 40.r, bottom: 40.r, right: 40.r),
    child: Center(
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
            child: Padding(
              padding: EdgeInsets.all(15.r),
              child: Icon(
                Icons.vpn_key,
                color: Colors.blue[900],
                size: 50.r,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'Welcome Back!',
            style: GoogleFonts.poppins(
                fontSize: 17.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  ),
);

Widget footerText(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Don't have an account?",
        style: GoogleFonts.poppins(fontSize: 14.sp),
      ),
      TextButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const RegistrationPage())).then((_) {
            email.clear();
            password.clear();
          });
        },
        child: Text(
          'Create one now.',
          style: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: Colors.blue[900]),
        ),
      ),
    ],
  );
}

Widget loginButton(BuildContext context, ObtenerUsuarios _obtenerusuarios) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      fixedSize: Size(290.w, 50.h),
      elevation: 10.0,
      foregroundColor: Colors.white,
      backgroundColor: Colors.blue[900],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
    ),
    onPressed: () {
      LoginMethod(context, _obtenerusuarios);
    },
    child: Center(
      child: Text(
        'Login',
        style: GoogleFonts.poppins(fontSize: 18.sp),
      ),
    ),
  );
}

var textLogin = Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Text(
      'Get Started',
      style: GoogleFonts.poppins(fontSize: 29.sp, fontWeight: FontWeight.bold),
    ),
  ],
);

var textInfo = Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Text(
      'Please enter your credentials',
      style: GoogleFonts.poppins(fontSize: 17.sp, fontWeight: FontWeight.w400),
    ),
  ],
);

Widget cardSocial(ButtonType button, String url) {
  Future<void> openUrl() async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint('No se pudo abrir la URL $url');
    }
  }

  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5.r)),
    ),
    elevation: 10.0,
    child: Padding(
      padding: EdgeInsets.all(8.r),
      child: FlutterSocialButton(
        mini: true,
        buttonType: button,
        onTap: () async {
          await openUrl();
        },
      ),
    ),
  );
}

var toolRemind = Row(
  children: [
    Text(
      'Reminder me next time',
      style: GoogleFonts.poppins(fontSize: 14.sp),
    ),
    const Spacer(),
    Checkbox(
      value: isCheck,
      onChanged: (x) {},
    ),
  ],
);

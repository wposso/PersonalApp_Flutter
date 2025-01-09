// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

bool isBack = false;

var headerLogo = Column(
  children: [
    Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Icon(
            Icons.vpn_key_sharp,
            color: Color.fromRGBO(13, 71, 161, 1),
            size: 90.0,
          ),
        ),
      ),
    ),
    const SizedBox(
      height: 10.0,
    ),
    Text(
      'Welcome Back',
      style: GoogleFonts.poppins(
          color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),
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
          style: GoogleFonts.poppins(fontSize: 14.0, color: Colors.white),
        ),
      ],
    ),
    const SizedBox(
      height: 10.0,
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'seamlessly & intuitively',
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 17.0, fontWeight: FontWeight.w600),
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
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(color: bordercolor, width: 2.0)),
        fixedSize: const Size(300.0, 50.0),
        backgroundColor: backcolor,
        foregroundColor: forecolor,
      ),
      onPressed: () {
        navigate;
      },
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(
            width: 30.0,
          ),
          Text(
            message,
            style: GoogleFonts.poppins(fontSize: 16.0),
          ),
        ],
      ));
}

Widget textFooter(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'Already have an account?',
        style: GoogleFonts.poppins(color: Colors.blue.shade500),
      ),
      TextButton(
          onPressed: () {
            isBack = true;
            Navigator.pushNamed(context, 'LoginPage', arguments: true);
          },
          child: Text(
            'Sign in',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold, color: Colors.white),
          ))
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
        icon: const Icon(
          Icons.power_settings_new,
          color: Colors.white,
          size: 30.0,
        )),
  ],
);

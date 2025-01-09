// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
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
    margin: const EdgeInsets.all(15.0),
    behavior: SnackBarBehavior.floating,
    backgroundColor: color,
    content: Row(
      children: [
        Text(
          message,
          style: GoogleFonts.poppins(),
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
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favorite'),
            trailing: Icon(Icons.send),
          )
        ],
      ),
    ),
  );
}

var headerContainer = Container(
  decoration: BoxDecoration(color: Colors.blue[900]),
  child: Padding(
    padding: const EdgeInsets.only(left: 50.0, right: 50.0, bottom: 50.0),
    child: Center(
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Icon(
                  Icons.vpn_key,
                  color: Colors.blue[900],
                  size: 50.0,
                )),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            'Welcome Back!',
            style: GoogleFonts.poppins(
                fontSize: 17.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          )
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
        style: GoogleFonts.poppins(),
      ),
      TextButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const RegistrationPage())).then((x) {
              email.clear();
              password.clear();
            });
          },
          child: Text(
            'Create one now.',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold, color: Colors.blue[900]),
          ))
    ],
  );
}

Widget loginButton(BuildContext context, ObtenerUsuarios _obtenerusuarios) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(290.0, 50.0),
          elevation: 10.0,
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue[900],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          )),
      onPressed: () {
        LoginMethod(context, _obtenerusuarios);
      },
      child: Center(
        child: Text(
          'Login',
          style: GoogleFonts.poppins(fontSize: 18.0),
        ),
      ));
}

var textLogin = Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Text(
      'Get Started',
      style: GoogleFonts.poppins(fontSize: 29.0, fontWeight: FontWeight.bold),
    ),
  ],
);

var textInfo = Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Text('Please enter your credentials',
        style:
            GoogleFonts.poppins(fontSize: 17.0, fontWeight: FontWeight.w400)),
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
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
    ),
    elevation: 10.0,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
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
      'Reminder me nextime',
      style: GoogleFonts.poppins(),
    ),
    const Spacer(),
    Checkbox(value: isCheck, onChanged: (x) {})
  ],
);

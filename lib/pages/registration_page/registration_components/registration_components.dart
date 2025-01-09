import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp_ftl/pages/registration_page/registration_logic/registration_logic.dart';

var emailcontrol = TextEditingController();
var passcontrol = TextEditingController();
var confpasscontrol = TextEditingController();

bool isCheckedReg = false;
bool obscureControlA = true;
bool obscureControlB = true;
String privacypolicy =
    "We value your privacy and are committed to protecting your personal information. By using this app, you agree to the following:\n\n"
    "- Data Collection: We collect information such as your email, name, and usage data to provide and improve our services.\n\n"
    "- Usage of Data: The data collected is used to personalize your experience, process transactions, and send updates.\n\n"
    "- Data Sharing: We do not share your personal information with third parties unless required by law or necessary to provide services.\n\n"
    "- Cookies: We use cookies to enhance your app experience and track usage.\n\n"
    "- Security: We take reasonable measures to secure your information, but we cannot guarantee complete protection.\n\n"
    "Your privacy is important to us. If you have any questions, feel free to contact us.";

Widget header(BuildContext context) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(color: Colors.blue[900]),
    child: Padding(
      padding: const EdgeInsets.only(
          top: 30.0, bottom: 30.0, right: 30.0, left: 15.0),
      child: Center(
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'LoginPage');
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 25.0,
                )),
            const SizedBox(
              width: 85.0,
            ),
            Text(
              "Let's start",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buildTextField(
  String label,
  String hintText,
  TextEditingController control,
  bool? isActive,
  IconButton? icon,
  VoidCallback? onIconTap,
) {
  return TextFormField(
    obscureText: isActive ?? false,
    controller: control,
    decoration: InputDecoration(
        suffixIcon:
            icon != null ? IconButton(onPressed: onIconTap, icon: icon) : null,
        label: Text(
          label,
          style: GoogleFonts.poppins(),
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        )),
  );
}

Widget buildRButton(BuildContext context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 10.0,
          fixedSize: const Size(290.0, 50.0),
          backgroundColor: Colors.blue[900],
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0))),
      onPressed: () {
        Registration(context);
      },
      child: Text(
        'Get Started',
        style: GoogleFonts.poppins(fontSize: 18.0),
      ));
}

void mostrarDialog(BuildContext context, String title, Widget actionWidget,
    Widget contentWidget) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
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

var textHeaderInfo = Column(
  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Welcome! Let's Create Your Account",
          style:
              GoogleFonts.poppins(fontSize: 17.0, fontWeight: FontWeight.w500),
        )
      ],
    ),
    const SizedBox(
      height: 7.0,
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Enter the required information to proceed.",
          style: GoogleFonts.poppins(
              fontSize: 14.0, fontWeight: FontWeight.normal),
        )
      ],
    ),
  ],
);

Widget buildTextfooter(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'Already have an account?',
        style: GoogleFonts.poppins(),
      ),
      TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'LoginPage');
          },
          child: Text(
            'Log in here.',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold, color: Colors.blue[900]),
          ))
    ],
  );
}

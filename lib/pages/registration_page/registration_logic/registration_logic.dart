// ignore_for_file: non_constant_identifier_names, no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp_ftl/pages/login_page/login_components/login_components.dart';
import 'package:myapp_ftl/pages/login_page/login_page.dart';
import 'package:myapp_ftl/pages/registration_page/registration_components/registration_components.dart';
import 'package:myapp_ftl/services/registration_service.dart';

Future<void> Registration(BuildContext context) async {
  final emailEntered = emailcontrol.text.trim();
  final passwordEntered = passcontrol.text.trim();
  final confpassEntered = confpasscontrol.text.trim();

  final CrearUsuario _crearusuario = CrearUsuario();

  if (passwordEntered != confpassEntered) {
    mostrarSnackBar(
        context, 'The passwords do not match.', Colors.red, Icons.info);
    return;
  } else if (emailcontrol.text.isEmpty ||
      passcontrol.text.isEmpty ||
      confpasscontrol.text.isEmpty) {
    mostrarSnackBar(
        context, 'Please fill in all required fields.', Colors.red, Icons.info);
  } else if (isCheckedReg != true) {
    mostrarSnackBar(context, 'Please accept the terms to continue.', Colors.red,
        Icons.info);
  } else {
    final response = await _crearusuario
        .crearusuario(emailEntered, passwordEntered)
        .then((x) {
      mostrarDialog(
          context,
          'Registration Successful',
          TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context,
                        MaterialPageRoute(builder: (x) => const LoginPage()))
                    .then((x) {
                  emailcontrol.clear();
                  passcontrol.clear();
                  confpasscontrol.clear();
                });
              },
              child: Text(
                'Done',
                style: GoogleFonts.poppins(),
              )),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Registration Successful! Your account has been created.',
                style: GoogleFonts.poppins(),
              )
            ],
          ));
    });
  }

  emailcontrol.clear();
  passcontrol.clear();
  confpasscontrol.clear();
}

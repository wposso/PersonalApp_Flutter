// ignore_for_file: non_constant_identifier_names, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:myapp_ftl/pages/login_page/login_components/login_components.dart';
import 'package:myapp_ftl/services/login_service.dart';

void LoginMethod(BuildContext context, ObtenerUsuarios _obtenerusuarios) {

  final enteredEmail = username.text.trim();
  final enteredPass = password.text.trim();

  bool userFound = false;

  for (var user in _obtenerusuarios.listaUsuarios) {
    if (user['Email'] == enteredEmail && user['Password'] == enteredPass) {
      userFound = true;
      break;
    } else if (enteredEmail.isEmpty || enteredPass.isEmpty) {
      mostrarSnackBar(context, 'Please fill in all required fields.', Colors.red,
          Icons.close);

      break;
    } else {
      mostrarSnackBar(
          context, 'Invalid credentials, please try again.', Colors.red, Icons.close);
      break;
    }
  }

  if (userFound) {
    mostrarSnackBar(
        context, 'Welcome! Login successful.', Colors.green, Icons.check);
  }
  username.clear();
  password.clear();
}

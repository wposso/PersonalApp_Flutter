// ignore_for_file: non_constant_identifier_names, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:myapp_ftl/features/login_screen/presentation/widgets/widgets.dart';
import 'package:myapp_ftl/features/login_screen/data/service/login_service.dart';
import 'package:myapp_ftl/main.dart';

void LoginMethod(BuildContext context, ObtenerUsuarios _obtenerusuarios) {
  final enteredEmail = email.text.trim();
  final enteredPass = password.text.trim();
  final Singin _singin = Singin();

  if (enteredEmail.isEmpty || enteredPass.isEmpty) {
    mostrarSnackBar(context, 'Please fill in all required fields.',
        const Color.fromRGBO(13, 71, 161, 1), Icons.info);
    return;
  }

  bool userFound = false;
  int getuserid = 0;

  for (var user in _obtenerusuarios.listaUsuarios) {
    if (user['Email'] == enteredEmail && user['Password'] == enteredPass) {
      userFound = true;
      getuserid = user['UserId'];
      break;
    }
  }

  if (userFound) {
    _singin.singin(getuserid).then((islogged) {
      if (islogged) {
        mostrarSnackBar(context, 'Welcome! Login successful.',
            const Color.fromRGBO(13, 71, 161, 1), Icons.check);
      }

      Navigator.pushReplacementNamed(context, '/PositionIndex');
    });
  } else {
    mostrarSnackBar(context, 'Invalid credentials, please try again.',
        const Color.fromRGBO(13, 71, 161, 1), Icons.info);
  }
  email.clear();
  password.clear();
}

void LogoutMethod(BuildContext context) {
  late Logout _logout = Logout();
  late ObtenerUsuarios _obtenerusuarios = ObtenerUsuarios();
  int getuserid = 0;

  for (var userID in _obtenerusuarios.listaUsuarios) {
    getuserid = userID['UserId'];
  }

  _logout.logout(getuserid).then((logoutsucess) {
    if (logoutsucess) {
      debugPrint('Sesión cerrada con éxito');
      Navigator.pushReplacementNamed(context, '/LoginScreen');
    } else {
      debugPrint('Error al cerrar sesión');
    }
  });
}

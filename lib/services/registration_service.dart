// ignore_for_file: avoid_print

import "dart:convert";
import "dart:math";
import "package:flutter/material.dart";
import "package:http/http.dart" as http;

String Url = 'https://localhost-node-js.onrender.com/login';

class CrearUsuario {
  Future<void> crearusuario(String email, String password) async {
    final response = await http.post(
        headers: ({"Content-Type": "application/json"}),
        body: jsonEncode({"email": email, "password": password}),
        Uri.parse(Url));
    if (response.statusCode == 200) {
      print('Usuario creado con éxito');
    } else {
      throw Exception('Error al intentar crear el usuario');
    }
  }
}

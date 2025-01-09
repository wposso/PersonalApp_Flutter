import "dart:convert";

import "package:flutter/material.dart";
import "package:http/http.dart" as http;

String Url = 'http://localhost:3000/login';

class ObtenerUsuarios {
 List<dynamic> listaUsuarios = [];

  Future<void> obtenerusuarios() async {
    try {
      final response = await http.get(Uri.parse('http://localhost:3000/login'));
      if (response.statusCode == 200) {
        listaUsuarios = jsonDecode(response.body);
      } else {
        throw Exception('No se pudieron obtener los usuarios');
      }
    } catch (x) {
      throw Exception('Error faltal:$x');
    }
  }
}

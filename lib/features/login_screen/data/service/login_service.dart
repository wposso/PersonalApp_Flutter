import "dart:convert";
import "package:flutter/material.dart";
import "package:http/http.dart" as http;

String Url = 'https://localhost-node-js.onrender.com/login/getuser';

class ObtenerUsuarios {
  List<dynamic> listaUsuarios = [];

  Future<void> obtenerusuarios() async {
    try {
      final response = await http.get(Uri.parse(Url));
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

class Singin {
  Future<bool> singin(int id) async {
    try {
      final response = await http.put(
        headers: ({'Content-Type': 'application/json'}),
        Uri.parse('https://localhost-node-js.onrender.com/login/singin/$id'),
      );
      if (response.statusCode == 200) {
        debugPrint('Usuario logueado éxitosamente');
        return true;
      } else {
        debugPrint(
            'Error al loguearse: ${response.statusCode} - ${response.body}');
        return false;
      }
    } catch (x) {
      debugPrint('Error al loguearse: $x');
      return false;
    }
  }
}

class Logout {
  Future<bool> logout(int id) async {
    try {
      final response = await http.put(
          headers: ({'Content-Type': 'application/json'}),
          Uri.parse('https://localhost-node-js.onrender.com/login/logout/$id'));
      if (response.statusCode == 200) {
        debugPrint('El usuario ha cerrado sesión con éxito');
        return true;
      } else {
        debugPrint('Error al cerrar sesión');
        return false;
      }
    } catch (x) {
      debugPrint('Error: $x');
      return false;
    }
  }
}

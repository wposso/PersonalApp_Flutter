import "dart:convert";
import "package:flutter/material.dart";
import "package:http/http.dart" as http;

String userdataURL = 'https://localhost-node-js.onrender.com/userdata';

class GetUserData {
  List<dynamic> userdatalist = [];

  Future<void> getuserdata() async {
    try {
      final response = await http.get(Uri.parse(userdataURL));
      if (response.statusCode == 200) {
        userdatalist = jsonDecode(response.body);
      } else {
        debugPrint('Error al obtener datos');
      }
    } catch (x) {
      debugPrint('Error de conexión');
    }
  }
}

// ignore_for_file: annotate_overrides, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp_ftl/pages/login_page/login_components/login_components.dart';
import 'package:myapp_ftl/pages/login_page/login_logic/login_logic.dart';
import 'package:myapp_ftl/services/login_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final ObtenerUsuarios _obtenerusuarios = ObtenerUsuarios();

  void initState() {
    super.initState();
    password.addListener(() {
      setState(() {});
    });
    Obtener();
  }

  Future<void> Obtener() async {
    try {
      await _obtenerusuarios.obtenerusuarios();
      setState(() {});
    } catch (x) {
      throw Exception('Error en metodo:$x');
    }
  }

  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.blue[900],
          body: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'IndexPage');
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 30.0,
                          ))
                    ],
                  ),
                ),
                headerContainer,
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(
                        top: 70.0, left: 20.0, right: 20.0, bottom: 1.0),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(50.0))),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        textLogin,
                        const SizedBox(
                          height: 10.0,
                        ),
                        textInfo,
                        const SizedBox(
                          height: 50.0,
                        ),
                        TextFormField(
                          controller: username,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.person),
                            label: Text(
                              'Email',
                              style: GoogleFonts.poppins(
                                  fontSize: 15.0, fontWeight: FontWeight.w300),
                            ),
                            hintText: 'Enter email',
                            hintStyle: GoogleFonts.poppins(fontSize: 13.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          obscureText: passwordVisible,
                          controller: password,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.vpn_key_sharp),
                              suffixIcon: password.text.isNotEmpty
                                  ? IconButton(
                                      onPressed: () {
                                        setState(() {
                                          passwordVisible = !passwordVisible;
                                        });
                                      },
                                      icon: Icon(passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off))
                                  : null,
                              label: Text(
                                'Password',
                                style: GoogleFonts.poppins(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w300),
                              ),
                              hintText: 'Enter password',
                              hintStyle: GoogleFonts.poppins(fontSize: 13.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0))),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            Text(
                              'Reminder me nextime',
                              style: GoogleFonts.poppins(),
                            ),
                            const Spacer(),
                            Switch(
                                thumbColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  if (states.contains(MaterialState.selected)) {
                                    return Colors.white;
                                  }
                                  return Colors.grey;
                                }),
                                trackColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  if (states.contains(MaterialState.selected)) {
                                    return Colors.green;
                                  }
                                  return Colors.grey.withOpacity(0.5);
                                }),
                                activeColor: Colors.green,
                                value: isActive,
                                onChanged: (x) {
                                  setState(() {
                                    isActive = x;
                                  });
                                })
                          ],
                        ),
                        const SizedBox(
                          height: 70.0,
                        ),
                        loginButton(context, _obtenerusuarios),
                        const SizedBox(
                          height: 90.0,
                        ),
                        footerText(context),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}

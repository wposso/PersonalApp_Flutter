// ignore_for_file: annotate_overrides, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp_ftl/pages/login_page/login_components/login_components.dart';
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
    Obtener();
    password.addListener(() {
      setState(() {});
    });
  }

  Future<void> Obtener() async {
    try {
      await _obtenerusuarios.obtenerusuarios();
      if (mounted) {
        setState(() {});
      }
    } catch (x) {
      throw Exception('Error en metodo:$x');
    }
    return;
  }

  // void dispose() {
  //   password.removeListener(() {});
  //   password.dispose(); // Libera los recursos del controlador de texto
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true);

    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.blue[900],
          body: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.r),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'IndexPage');
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 30.r,
                          ))
                    ],
                  ),
                ),
                headerContainer,
                Flexible(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    padding: EdgeInsets.only(
                        top: 55.r, left: 20.r, right: 20.r, bottom: 10.r),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(50.r))),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        textLogin,
                        textInfo,
                        SizedBox(
                          height: 35.h,
                        ),
                        TextFormField(
                          controller: email,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.person),
                            label: Text(
                              'Email',
                              style: GoogleFonts.poppins(
                                  fontSize: 15.sp, fontWeight: FontWeight.w300),
                            ),
                            hintText: 'Enter email',
                            hintStyle: GoogleFonts.poppins(fontSize: 13.sp),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r)),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
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
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w300),
                              ),
                              hintText: 'Enter password',
                              hintStyle: GoogleFonts.poppins(fontSize: 13.sp),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.r))),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Text(
                              'Remember me next time',
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
                        SizedBox(
                          height: 60.h,
                        ),
                        loginButton(context, _obtenerusuarios),
                        SizedBox(
                          height: 20.h,
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

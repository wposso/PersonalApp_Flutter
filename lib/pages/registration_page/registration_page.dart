import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp_ftl/pages/login_page/login_components/login_components.dart';
import 'package:myapp_ftl/pages/registration_page/registration_components/registration_components.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  void initState() {
    super.initState();
    passcontrol.addListener(() {
      setState(() {});
    });
    confpasscontrol.addListener(() {
      setState(() {});
    });
  }

  void dispose() {
    emailcontrol.dispose();
    passcontrol.dispose();
    confpasscontrol.dispose();
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
            header(context),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(50.0))),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 60.0, bottom: 15.0),
                  child: Column(
                    children: [
                      textHeaderInfo,
                      const SizedBox(
                        height: 40.0,
                      ),
                      buildTextField(
                          'Email Address',
                          'Enter your email',
                          emailcontrol,
                          false,
                          const IconButton(onPressed: null, icon: Icon(null)),
                          () {}),
                      const SizedBox(
                        height: 15.0,
                      ),
                      buildTextField(
                          'Enter Password',
                          'Enter a strong password',
                          passcontrol,
                          obscureControlA,
                          passcontrol.text.isNotEmpty
                              ? IconButton(
                                  onPressed: () {
                                    setState(() {
                                      obscureControlA = !obscureControlA;
                                    });
                                  },
                                  icon: Icon(obscureControlA
                                      ? Icons.visibility
                                      : Icons.visibility_off))
                              : null,
                          () {}),
                      const SizedBox(
                        height: 15.0,
                      ),
                      buildTextField(
                          'Confirm Password',
                          'Type your password again',
                          confpasscontrol,
                          obscureControlB,
                          confpasscontrol.text.isNotEmpty
                              ? IconButton(
                                  onPressed: () {
                                    setState(() {
                                      obscureControlB = !obscureControlB;
                                    });
                                  },
                                  icon: Icon(obscureControlB
                                      ? Icons.visibility
                                      : Icons.visibility_off))
                              : null,
                          () {}),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: isCheckedReg,
                            onChanged: (value) {
                              setState(() {
                                mostrarDialog(
                                    context,
                                    'Privacy Polyce',
                                    Row(
                                      children: [
                                        Checkbox(
                                            value: isCheckedReg,
                                            onChanged: (value) {
                                              Navigator.pop(context);
                                              setState(() {
                                                isCheckedReg = true;
                                              });
                                              if (isCheckedReg) {
                                                setState(() {
                                                  isCheckedReg = value ?? false;
                                                });
                                              }
                                            }),
                                        const SizedBox(
                                          width: 5.0,
                                        ),
                                        Text(
                                          'I accept the Terms.',
                                          style: GoogleFonts.poppins(),
                                        ),
                                      ],
                                    ),
                                    SingleChildScrollView(
                                        child: Text(
                                      privacypolicy,
                                      style: GoogleFonts.poppins(),
                                    )));
                              });
                            },
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Text('I accept the Terms and Privacy Policy.',
                              style: GoogleFonts.poppins())
                        ],
                      ),
                      const SizedBox(
                        height: 80.0,
                      ),
                      buildRButton(context),
                      const Spacer(),
                      buildTextfooter(context)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

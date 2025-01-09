import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp_ftl/pages/index_page/index_components/index_components.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  late bool isBack = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as bool?;
    if (args != null) {
      setState(() {
        isBack = args;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.blue[900],
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              iconExit,
              const Spacer(),
              headerLogo,
              const SizedBox(
                height: 90,
              ),
              textInfo,
              const SizedBox(
                height: 50,
              ),
              builderButton(
                  'Sign in with token',
                  Colors.white,
                  const Color.fromRGBO(13, 71, 161, 1),
                  Colors.white,
                  Icons.key,
                  () {}),
              const SizedBox(
                height: 15.0,
              ),
              builderButton(
                  'Create an account',
                  const Color.fromRGBO(13, 71, 161, 1),
                  Colors.white,
                  Colors.white,
                  null, () {
                Navigator.pushNamed(context, 'RegistrationPage');
              }),
              const SizedBox(
                height: 50.0,
              ),
              textFooter(context),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          isBack = !isBack;
                        });
                        Navigator.pushNamed(context, 'IndexPage');
                      },
                      icon: isBack
                          ? const Icon(Icons.back_hand)
                          : const SizedBox.shrink())
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}

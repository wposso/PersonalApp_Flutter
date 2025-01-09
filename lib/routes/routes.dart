import "package:flutter/material.dart";
import "package:myapp_ftl/pages/index_page/index_page.dart";
import "package:myapp_ftl/pages/login_page/login_page.dart";
import "package:myapp_ftl/pages/registration_page/registration_page.dart";

Map<String, Widget Function(BuildContext)> routes = {
  'LoginPage': (context) => const LoginPage(),
  'IndexPage': (context) => const IndexPage(),
  'RegistrationPage': (context) => const RegistrationPage()
};

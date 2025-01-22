import "package:flutter/material.dart";
import "package:myapp_ftl/main.dart";
import "package:myapp_ftl/pages/home_page/home_page.dart";
import "package:myapp_ftl/pages/index_page/index_page.dart";
import "package:myapp_ftl/pages/login_page/login_page.dart";
import "package:myapp_ftl/pages/registration_page/registration_page.dart";
import "package:myapp_ftl/pages/settings_page/settings_page.dart";

Map<String, Widget Function(BuildContext)> routes = {
  'LoginPage': (context) => const LoginPage(),
  'IndexPage': (context) => const IndexPage(),
  'RegistrationPage': (context) => const RegistrationPage(),
  'HomePage': (context) => const HomePage(),
  'PositionIndex': (context) => const PositionIndex(),
  'SettingsPage': (context) => const SettingsPage(),
};

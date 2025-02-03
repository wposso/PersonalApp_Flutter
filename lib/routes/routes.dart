import "package:flutter/material.dart";
import "package:myapp_ftl/features/login_screen/login_screen.dart";
import "package:myapp_ftl/main.dart";
import "package:myapp_ftl/features/contacts_screen/presentation/contacts_screen.dart";
import "package:myapp_ftl/features/home_screen/presentation/home_screen.dart";
import "package:myapp_ftl/features/images_screen/presentation/images_screen.dart";
import "package:myapp_ftl/features/index_screen/presentation/index_screen.dart";
import "package:myapp_ftl/features/registration_screen/registration_screen.dart";
import "package:myapp_ftl/features/settings_screen/settings_screen.dart";

Map<String, Widget Function(BuildContext)> routes = {
  'LoginScreen': (context) => const LoginScreen(),
  'IndexScreen': (context) => const IndexScreen(),
  'RegistrationScreen': (context) => const RegistrationScreen(),
  'HomeScreen': (context) => const HomeScreen(),
  'PositionIndex': (context) => const PositionIndex(),
  'SettingsScreen': (context) => const SettingsScreen(),
  'ContactsScreen': (context) => const ContactsScreen(),
  'ImagesScreen': (context) => const ImagesScreen()
};

import 'package:Craft_Social_Media/authentications/login_screen.dart';
import 'package:Craft_Social_Media/authentications/login_screen_dart.dart';
import 'package:Craft_Social_Media/authentications/registration.dart';
import 'package:Craft_Social_Media/authentications/user_information_screen.dart';
import 'package:Craft_Social_Media/contains/constains.dart';
import 'package:Craft_Social_Media/firebase_options.dart';
import 'package:Craft_Social_Media/main_screnn/home_screen.dart';
import 'package:Craft_Social_Media/provider/authentication_provider.dart';
import 'package:Craft_Social_Media/provider/theme_provider.dart';
import 'package:Craft_Social_Media/themes/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => MyThemeProvider(),
    ),
    ChangeNotifierProvider(create: (_) => AuthenticationProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    getCurrentTheme();
    super.initState();
  }

  void getCurrentTheme() async {
    await Provider.of<MyThemeProvider>(context, listen: false)
        .getThemesStatus();
  }

  final String a = '1223123132313';
  @override
  Widget build(BuildContext context) {
    return Consumer<MyThemeProvider>(
        builder: (BuildContext context, value, Widget? child) {
      return MaterialApp(
        title: 'CSO',
        debugShowCheckedModeBanner: false,
        theme:
            MyTheme.themeData(isDarkTheme: value.themeType, context: context),
        initialRoute: Constains.loginScreenDraft,
        routes: {
          Constains.loginScreen: (context) => const LoginScreen(),
          Constains.registrationScreen: (context) => const RegistrationScreen(),
          Constains.homeScreen: (context) => const HomeScreen(),
          Constains.userInformtaionScreen: (context) =>
              const UserInformationScreen(),
          Constains.loginScreenDraft: (context) => const LoginScreenDraft(),
        },
      );
    });
  }
}

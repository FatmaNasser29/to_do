import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/application_theme.dart';
import 'package:to_do/lay_out/lay_out.dart';
import 'package:to_do/login/login_screen.dart';
import 'package:to_do/provider/app_auth_provider.dart';
import 'package:to_do/provider/locale_provider.dart';
import 'package:to_do/provider/theme_provider.dart';
import 'package:to_do/register/register_screen.dart';
import 'package:to_do/settings/settings_screen.dart';
import 'package:to_do/splash/splash_screen.dart';
import 'package:to_do/tasks_screen/tasks_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Provider.debugCheckInvalidValueType = null;
  runApp(
    MultiProvider(
      providers: [
        Provider<ThemeProvider>(create: (context) => ThemeProvider()),
        Provider<LocaleProvider>(create: (context) => LocaleProvider()),
        Provider<AppAuthProvider>(create: (context) => AppAuthProvider()),
      ],
      child: const ToDo(),
    ),
  );
}

class ToDo extends StatelessWidget {
  const ToDo({super.key});
  @override
  Widget build(BuildContext context) {
    var themeProvider = ThemeProvider();
    var localeProvider = LocaleProvider();
    var appAuthProvider = Provider.of<AppAuthProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ApplicationTheme.appThemeLight,
      darkTheme: ApplicationTheme.appThemeDark,
      themeMode: themeProvider.currentTheme,
      locale: Locale(localeProvider.currentLocale),
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        LayOut.routeName: (context) => LayOut(),
        SettingsScreen.routeName: (context) => SettingsScreen(),
        TasksScreen.routeName: (context) => TasksScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
      },
      initialRoute:
          appAuthProvider.isLoggedIn()
              ? LayOut.routeName
              : LoginScreen.routeName,
    );
  }
}

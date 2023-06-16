import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:photoplay_app/Providers/login_sharedpreference_provider.dart';
import 'package:photoplay_app/Screens/login_screen.dart';
import 'package:photoplay_app/Screens/navbar_roots.dart';
import 'package:provider/provider.dart';

import 'Providers/theme_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (BuildContext context) => ThemeChangerProvider()),
    ChangeNotifierProvider(create: (BuildContext context) => LoginSharedPreferenceProvider()),
  ],
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  bool isLogin = false;

  @override
  void initState() {
    Provider.of<LoginSharedPreferenceProvider>(context,listen: false).getValue();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context,snapshot){
        if (snapshot.hasError) {
          print("Something went wrong");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        return Builder(builder: (BuildContext context){
          return Consumer<LoginSharedPreferenceProvider>(
            builder: (context, provider,_) {
              return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Flutter Demo',
                  themeMode: Provider.of<ThemeChangerProvider>(context).themeMode,
                  theme: ThemeData(
                      brightness: Brightness.light
                  ),
                  darkTheme: ThemeData(
                    brightness: Brightness.dark,
                  ),
                  home: provider.getBoolLogin == true?const NavbarRoots():const LoginScreen()
              );
            }
          );
        });
      },

    );
  }
}





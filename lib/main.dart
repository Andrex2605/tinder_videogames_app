import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tinder_videogames_app/config/theme/app_theme.dart';
import 'package:tinder_videogames_app/presentation/Screens/home/home_screen.dart';
import 'package:tinder_videogames_app/presentation/Screens/inicial_screen.dart';
import 'package:tinder_videogames_app/presentation/Screens/login_screen.dart';
import 'package:tinder_videogames_app/presentation/Screens/register_screen.dart';


void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return 
      MaterialApp(
        title: 'Videogame Tinder',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        initialRoute: '/',
        routes: {
          '/':(context)=> const LoginScreen(),
          '/register':(context)=> const RegisterScreen(),
          '/home':(context)=> const HomeScreen(),
          '/initial':(context) => const InitialScreen()
        },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia/providers/name_provider.dart';
import 'package:suitmedia/providers/user_provider.dart';
import 'package:suitmedia/screens/first_screen.dart';
import 'package:suitmedia/screens/second_screen.dart';
import 'package:suitmedia/screens/third_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => NameProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const FirstScreen(),
          '/second': (context) => const SecondScreen(),
          '/third': (context) => const ThirdScreen(),
        },
      ),
    );
  }
}

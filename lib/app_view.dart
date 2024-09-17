import 'package:flutter/material.dart';
import 'package:tugas_2/screens/home/views/home_screen.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Data Mahasiswa",
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          background: Color(0xFFE3EDF7), // Light blue
          onBackground: Colors.black87,
          primary: Color(0xFFFEF9D7), // Light yellow
          onPrimary: Colors.black87,
          secondary: Color(0xFFDCE8D4), // Light green
          onSecondary: Colors.black87,
          surface: Color(0xFFB6CBDE), // Blue
          onSurface: Colors.black87,
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Color(0xFFB6CBDE), // Blue
          foregroundColor: Colors.black87,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Color(0xFFE3EDF7), // Light blue
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFDCE8D4), // Light green
            foregroundColor: Colors.black87,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

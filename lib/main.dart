import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hp_printer_guide/printers_list.dart';
import 'package:hp_printer_guide/styling/appbar.dart';
import 'package:hp_printer_guide/styling/drawer.dart';
import 'package:lottie/lottie.dart'; // Import Lottie for loading animation
import 'dart:ui';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          const TextTheme(
            displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            displaySmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            headlineMedium:
                TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            headlineSmall:
                TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            titleLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
            labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
            labelSmall: TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
          ),
        ),
      ),
      home: Main(),
    ),
  );
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> with SingleTickerProviderStateMixin {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadApp();
  }

  // Simulate loading state for 3 seconds
  Future<void> _loadApp() async {
    await Future.delayed(
      Duration(seconds: 2),
    );
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _isLoading
          ? Stack(
              children: [
                // Blurred gradient background
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.deepPurple.shade800,
                          Colors.blue.shade800,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
                // Lottie loading animation centered
                Center(
                  child: Lottie.asset('assets/loading.json',
                      width: 100, height: 100),
                ),
              ],
            )
          : Scaffold(
              appBar: GradientAppBarFb1(), // Your custom gradient app bar
              drawer: DrawerFb1(), // Your custom drawer
              body: PrinterListScreen(), // Your main content
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_algo/login1.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String _title = 'GoAlgo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: const Color(0xFF303F9F),
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      title: _title,
      home: const WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //Appbar
        appBar: AppBar(
          title: const Text(
            'GoAlgo',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color(0xFF303F9F),
          centerTitle: true,
        ),

        //Body
        body: Container(
          padding: const EdgeInsets.all(16.0),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.asset(
                  'assets/welcome-15.gif',
                  height: 200,
                  fit: BoxFit.cover,
                  width: 250,
                ),
              ),
              const SizedBox(height: 40.0),
              Text(
                'Welcome to Go Algo',
                style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: const Text('Get Started'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF303F9F),
        centerTitle: true,
        title: const Text(
          "Level 1",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const PasswordDialog1(),
    );
  }
}

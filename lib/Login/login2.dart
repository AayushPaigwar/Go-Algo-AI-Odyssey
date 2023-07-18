import 'package:flutter/material.dart';

import '../Quiz/quiz2.dart';

class HomePage2 extends StatelessWidget {
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF303F9F),
        centerTitle: true,
        title: const Text(
          "Round 2",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const PasswordDialog2(),
    );
  }
}

class PasswordDialog2 extends StatefulWidget {
  const PasswordDialog2({super.key});

  @override
  _PasswordDialogState createState() => _PasswordDialogState();
}

class _PasswordDialogState extends State<PasswordDialog2> {
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _submitPassword() {
    String password = _passwordController.text;

    if (password == '1234') {
      // ignore: avoid_print
      print('Password is correct!');
      // Close the dialog box
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Quiz2(),
        ),
      );
    } else {
      // Password is incorrect, show an error message
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Incorrect Password'),
            content: const Text('Please try again.'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Enter Password'),
      content: TextField(
        controller: _passwordController,
        obscureText: true,
        decoration: const InputDecoration(hintText: 'Password'),
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          onPressed: _submitPassword,
          child: const Text('Submit'),
        ),
      ],
    );
  }
}

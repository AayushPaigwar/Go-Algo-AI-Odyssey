import 'package:flutter/material.dart';
import 'package:go_algo/quiz3.dart';

class HomePage3 extends StatelessWidget {
  const HomePage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF303F9F),
        centerTitle: true,
        title: const Text(
          "Round 3",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const PasswordDialog3(),
    );
  }
}

class PasswordDialog3 extends StatefulWidget {
  const PasswordDialog3({super.key});

  @override
  _PasswordDialogState createState() => _PasswordDialogState();
}

class _PasswordDialogState extends State<PasswordDialog3> {
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _submitPassword() {
    String password = _passwordController.text;

    if (password == '1234') {
      // Password is correct, perform your desired action here
      // ignore: avoid_print
      print('Password is correct!');
      // Close the dialog box
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Quiz3(),
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

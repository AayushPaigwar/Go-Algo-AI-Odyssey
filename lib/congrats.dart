import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CongratulationsPage extends StatefulWidget {
  final String message;
  final int elapsedtime;
  final int time;

  const CongratulationsPage({
    Key? key,
    required this.message,
    required this.elapsedtime,
    required this.time,
  }) : super(key: key);

  @override
  _CongratulationsPageState createState() => _CongratulationsPageState();
}

class _CongratulationsPageState extends State<CongratulationsPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  // ignore: unused_field
  late Animation<double> _animation;

  final TextEditingController _teamNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Congratulations! 🎉',
          style: TextStyle(
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Here are your results📊:",
                style: TextStyle(
                  fontSize: 24.0,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.w400,
                )),
            const SizedBox(height: 40.0),
            Text(
              'Time taken in Quiz 3: ${widget.elapsedtime} seconds',
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Total Time Taken: ${widget.time} seconds',
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 24.0),
            TextFormField(
              controller: _teamNameController,
              decoration: const InputDecoration(
                labelText: 'Enter Team Name',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String teamName = _teamNameController.text;
                print('Team Name: $teamName');
              },
              child: SingleChildScrollView(
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Submit'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

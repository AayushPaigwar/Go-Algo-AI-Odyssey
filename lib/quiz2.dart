import 'package:flutter/material.dart';
import 'package:go_algo/login3.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

class Quiz2 extends StatefulWidget {
  const Quiz2({Key? key}) : super(key: key);

  @override
  _Quiz2State createState() => _Quiz2State();
}

class _Quiz2State extends State<Quiz2> {
  List<String> stepList = [
    'Problem Identification',
    'Problem Scoping',
    'Data Acquisition',
    'Data Exploration',
    'Data Modelling',
    'Evaluation',
    'Deployment',
  ]..shuffle();

  final List<String> correctOrderList = [
    'Problem Identification',
    'Problem Scoping',
    'Data Acquisition',
    'Data Exploration',
    'Data Modelling',
    'Evaluation',
    'Deployment',
  ];

  bool isOrderCorrect() {
    for (int i = 0; i < stepList.length; i++) {
      if (stepList[i] != correctOrderList[i]) {
        return false;
      }
    }
    return true;
  }

  Timer? _timer;
  int _elapsedTimeInSeconds = 0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedTimeInSeconds++;
      });
    });
  }

  void _stopTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Round 2'),
        automaticallyImplyLeading: false,
        elevation: 20,
      ),
      body: ReorderableListView(
        key: const Key('reorderable_list'),
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (newIndex > oldIndex) {
              newIndex -= 1;
            }
            final String item = stepList.removeAt(oldIndex);
            stepList.insert(newIndex, item);
          });
        },
        header: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Arrange the following steps in development of Machine Learning Model",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
          ),
        ),
        children: stepList
            .map(
              (step) => ReorderableDragStartListener(
                index: stepList.indexOf(step),
                key: ValueKey(step),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF3366FF), Color(0xFF00CCFF)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        step,
                        style: const TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 150.0),
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            if (isOrderCorrect()) {
              _stopTimer();
              int timeTakenInSeconds = _elapsedTimeInSeconds;
              print('Elapsed time: $timeTakenInSeconds seconds');
              // Move to the next page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Login3(
                    elapsedTime: timeTakenInSeconds,
                  ),
                ),
              );
              print('Order is correct, moving to next page...');
            } else {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Try Again'),
                    content: const Text(
                      'The sequence is incorrect. Please try again.',
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            }
          },
          child: const Icon(Icons.check),
        ),
      ),
    );
  }
}

class CustomPageRoute extends PageRouteBuilder {
  final Widget page;

  CustomPageRoute({required this.page})
      : super(
          pageBuilder: (_, __, ___) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final tween = TweenSequence(
              [
                TweenSequenceItem(
                  tween: Tween(
                    begin: const Offset(0.0, 0.0),
                    end: const Offset(-1.0, 0.0),
                  ).chain(CurveTween(curve: Curves.easeOut)),
                  weight: 1.0,
                ),
                TweenSequenceItem(
                  tween: Tween(
                    begin: const Offset(1.0, 0.0),
                    end: const Offset(0.0, 0.0),
                  ).chain(CurveTween(curve: Curves.easeIn)),
                  weight: 1.0,
                ),
              ],
            );
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
}

class Login3 extends StatelessWidget {
  final int elapsedTime;

  const Login3({Key? key, required this.elapsedTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Round 2 Completed',
          style: TextStyle(
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontWeight: FontWeight.w100),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Elapsed Time:',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              '$elapsedTime seconds',
              style: const TextStyle(fontSize: 48),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage3(),
                    ),
                  );
                },
                child: const Text('Enter Round 3'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

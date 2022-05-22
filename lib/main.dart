import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blueGrey,
          appBar: AppBar(
            title: const Text("Quizzler App"),
          ),
          body: const quizzler(),
        ),
      ),
    ),
  );
}

class quizzler extends StatefulWidget {
  const quizzler({Key? key}) : super(key: key);

  @override
  State<quizzler> createState() => _quizzlerState();
}

class _quizzlerState extends State<quizzler> {
  final List<String> questions = [
    'Everything in Flutter is a Widget',
    'Flutter uses Dart Language',
    'Flutter is a Language',
    'Flutter is Created by GOOGLE',
    'End of Quiz'
  ];
  final List<bool> answers = [true, true, false, true];
  List<Widget> result = [];
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          questions[counter],
          style: const TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 50),
        SizedBox(
          height: 50,
          width: 100,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
            ),
            onPressed: () {
              setState(
                () {
                  if (answers[counter] == true) {
                    result.add(const Icon(
                      Icons.check_circle_outline,
                      size: 50,
                    ));
                  } else {
                    result.add(const Icon(
                      Icons.highlight_off,
                      size: 50,
                    ));
                  }
                  if (counter < questions.length) {
                    counter++;
                  }
                },
              );
            },
            child: const Text("True",
                style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 50,
          width: 100,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red)),
            onPressed: () {
              setState(
                () {
                  if (answers[counter] == false) {
                    result.add(const Icon(
                      Icons.check_circle_outline,
                      size: 50,
                    ));
                  } else {
                    result.add(const Icon(
                      Icons.highlight_off,
                      size: 50,
                    ));
                  }
                  if (counter < questions.length) {
                    counter++;
                  }
                },
              );
            },
            child: const Text(
              "False",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
        const SizedBox(height: 90),
        Row(children: result),
      ],
    );
  }
}

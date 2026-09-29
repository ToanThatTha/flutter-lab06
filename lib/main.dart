import 'package:flutter/material.dart';
import 'quiz_brain.dart';

final QuizBrain quizBrain = QuizBrain();

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    final bool correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {
      scoreKeeper.add(
        userPickedAnswer == correctAnswer
            ? const Icon(Icons.check, color: Colors.green)
            : const Icon(Icons.close, color: Colors.red),
      );

      if (quizBrain.isFinished()) {
        final int score = scoreKeeper
            .where((icon) => icon.icon == Icons.check)
            .length;
        final int total = scoreKeeper.length;
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            title: const Text('Finished!'),
            content: Text('You\'ve reached the end of the quiz.\nScore: $score/$total'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Restart'),
              ),
            ],
          ),
        );
        quizBrain.reset();
        scoreKeeper.clear();
      } else {
        quizBrain.nextQuestion();
      }
    });
  }

  Widget answerButton(String label, Color color, bool value) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
          ),
          onPressed: () => checkAnswer(value),
          child: Text(label, style: const TextStyle(fontSize: 20.0)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ),
          ),
        ),
        answerButton('True', Colors.green, true),
        answerButton('False', Colors.red, false),
        SizedBox(height: 30, child: Row(children: scoreKeeper)),
      ],
    );
  }
}

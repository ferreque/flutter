import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.chooseAnswer});

  final void Function(String answer) chooseAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QestionScreenState();
  }
}

class _QestionScreenState extends State<QuestionScreen> {
  var questionNumber = 0;

  void answerQuestion(String selectedAnswers) {

    widget.chooseAnswer(selectedAnswers);
    setState(() {
      questionNumber++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[questionNumber];
    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffleAnswers().map((answers) {
              return AnswerButton(
                answerText: answers,
                onTap: () {
                  answerQuestion(answers);
    
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}

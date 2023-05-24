import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_data.dart';
import 'package:flutter/material.dart';

class AnswerScreen extends StatelessWidget {
  const AnswerScreen({
    super.key,
    required this.selectedAnswers, required this.restartQuiz
  });

   final void Function() restartQuiz;

  final List<String> selectedAnswers;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': selectedAnswers[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();

    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == ['correct_answer'];
    }).length;

    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
          child: Text(
            'Contestaste $numCorrectQuestions preguntas correctamente de un total de $numTotalQuestions!',
            textAlign: TextAlign.center,style: const TextStyle(color: Color.fromARGB(255, 184, 140, 192), fontWeight: FontWeight.bold ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        QuestionsData(summaryData),
        const SizedBox(
          height: 30,
        ),
        TextButton.icon(onPressed: restartQuiz, icon: const Icon(Icons.refresh, color: Colors.white,), label: const Text('Restart!', style: TextStyle(color: Colors.white),))
      ],
    ));
  }
}

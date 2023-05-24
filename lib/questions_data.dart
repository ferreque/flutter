import 'package:flutter/material.dart';

class QuestionsData extends StatelessWidget {
  const QuestionsData(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
          child: Column(
            children: summaryData.map(
              (data) {
                return Row(children: [
                  Container(
                    margin: const EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                        color: (Colors.amber),
                        border: Border.all(),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100))),
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          data['question'] as String,
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        data['user_answer'] == data['correct_answer']? Text(data['user_answer'] as String, style: const TextStyle(color: Colors.purple)): Text(data['user_answer'] as String,style: const TextStyle(color: Colors.yellow),),
                        Text(data['correct_answer'] as String, style:const TextStyle(color:Colors.blue)),
                      ],
                    ),
                  )
                ]);
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}

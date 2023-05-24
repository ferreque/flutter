import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {required this.answerText, required this.onTap, super.key});

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: ElevatedButton(
        
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          
          
          backgroundColor: (const Color.fromARGB(255, 43, 16, 48)),
          padding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        
        child: Text(
          answerText,
          style: const TextStyle(color: Colors.white),
          
        ),
        
      ),
    );
  }
}

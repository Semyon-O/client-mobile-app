import 'package:client_admin_panel/model/feedback_model.dart';
import 'package:flutter/material.dart';

class FeedbackCard extends StatelessWidget {
  final FeedbackItem feedback;

  const FeedbackCard({
    Key? key,
    required this.feedback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text("Номер заявки:"),
                Expanded(child: Text("${feedback.order}", textAlign: TextAlign.end)),
              ],
            ),
            Row(
              children: [
                const Text("Оценка:"),
                Expanded(child: Text("${feedback.score}", textAlign: TextAlign.end)),
              ],
            ),
            Column(
             children: [
               Row(
                 children: [
                   const Text("Ваш комментарий:"),
                 ],
               ),
               Row(
                 children: [
                   Expanded(child: Text("${feedback.feedbackDescription}", maxLines: null, softWrap: true,))
                 ],
               )
             ], 
            )
          ],
        ),
      ),
    );
  }
}
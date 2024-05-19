import 'package:client_admin_panel/viewmodel/feedback_viewmodel.dart';
import 'package:client_admin_panel/viewmodel/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class ReviewPage extends StatefulWidget {

  final id_order;

  const ReviewPage({super.key, required this.id_order});

  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final _formKey = GlobalKey<FormState>();
  int _rating = 1;
  String _review = '';

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      var feedbackViewModel = Provider.of<FeedbackViewModel>(context, listen: false);
      var userViewModel = Provider.of<UserViewModel>(context, listen: false);
      print(_rating);
      print(_review);

      feedbackViewModel.createNewFeedback(
          userViewModel.user,
          widget.id_order,
          _review,
          _rating)

      .then((_)  {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Отзыв отправлен')),
        );
      })
      .catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.toString())),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Оставить отзыв'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              SizedBox(height: 16.0),
              DropdownButtonFormField<int>(
                decoration: InputDecoration(labelText: 'Оценка'),
                value: _rating,
                onChanged: (value) {
                  setState(() {
                    _rating = value!;
                  });
                },
                items: List.generate(5, (index) {
                  return DropdownMenuItem(
                    value: index + 1,
                    child: Text('${index + 1} звезд'),
                  );
                }),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(labelText: 'Отзыв'),
                maxLines: 5,
                onSaved: (value) {
                  _review = value!;
                },
              ),
              SizedBox(height: 48.0),
              TextButton(
                onPressed: () {
                  _submitForm();
                },
                child: Text("Отправить", style: TextStyle(
                    color: Color.fromRGBO(5, 96, 250, 1)
                ),),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                          color: Color.fromRGBO(5, 96, 250, 1)
                      ),
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
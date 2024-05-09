import 'package:client_admin_panel/viewmodel/feedback_viewmodel.dart';
import 'package:client_admin_panel/viewmodel/user_viewmodel.dart';
import 'package:client_admin_panel/views/common/feedback_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {


  @override
  void initState() {
    super.initState();
    var user = Provider.of<UserViewModel>(context, listen: false).user;
    Provider.of<FeedbackViewModel>(context, listen: false).fetchFeedbacks(user!);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () async  {

            },
          )
        ],
      ),
      body: Consumer<FeedbackViewModel>(
        builder: (BuildContext context, FeedbackViewModel value, Widget? child) {
          if (value.isLoadingData) {
            return (Center(child: CircularProgressIndicator(),));
          }
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: ListView.builder(
                    itemCount: value.listFeedbacks.length,
                    itemBuilder: (context, index) {
                      return FeedbackCard(feedback: value.listFeedbacks[index]);
                    }
                  ),
                )
              )
            ],
          );
        }
      ),
    );
  }
}

import 'package:client_admin_panel/model/feedback_model.dart';
import 'package:client_admin_panel/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:client_admin_panel/settings.dart';


class FeedbackViewModel extends ChangeNotifier {


  List<FeedbackItem> _listFeedbackItems = [];
  List<FeedbackItem>  get listFeedbacks => _listFeedbackItems;

  bool _isLoadingData = false;
  bool get isLoadingData => _isLoadingData;

  Future<void> fetchFeedbacks(User user) async {
    _isLoadingData = true;
    notifyListeners();

    try {
      final response = await http.get(
          Uri.parse('${ApiSettings.url}/orders/${ApiSettings.feedbackDomain}/'),
          headers: {
            "Authorization": user.token,
          }
      );

      if (response.statusCode == 200) {
        String responseBody = utf8.decode(response.bodyBytes);
        List<dynamic> responseData = json.decode(responseBody);
        _listFeedbackItems = responseData.map((json) => FeedbackItem.fromJson(json)).toList();
        print(_listFeedbackItems);
      }

    } catch (e) {
      print("[ERROR]: ${e}");
    }

    _isLoadingData = false;
    notifyListeners();

  }

  Future<void> createNewFeedback(int order) async {

  }

}

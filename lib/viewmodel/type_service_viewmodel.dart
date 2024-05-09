import 'dart:convert';

import 'package:client_admin_panel/model/order_model.dart';
import 'package:client_admin_panel/settings.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;


class ServiceTypeViewModel extends ChangeNotifier {

  List<ServiceType> _listServiceType = [];
  List<ServiceType> get listServiceType => _listServiceType;

  Future<void> fetchServiceTypes() async {

    try {
      final response = await http.get(
          Uri.parse('${ApiSettings.url}/orders/type/')
      );

      if (response.statusCode == 200) {
        String responseBody = utf8.decode(response.bodyBytes);
        List<dynamic> responseData = json.decode(responseBody);
        _listServiceType = responseData.map((json) => ServiceType.fromJson(json)).toList();
      }
      print(_listServiceType);
      notifyListeners();
    } catch (e) { }
  }
}
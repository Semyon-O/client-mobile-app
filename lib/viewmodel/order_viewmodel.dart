import 'dart:convert';

import 'package:client_admin_panel/model/order_model.dart';
import 'package:client_admin_panel/model/user_model.dart';
import 'package:client_admin_panel/settings.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OrderViewModel extends ChangeNotifier {

  List<Order> _listOrders = [];
  List<Order> get listOrders => _listOrders;

  bool _isLoadingData = false;
  bool get isLoadingData => _isLoadingData;

  Future<void> fetchAllOrders(User user) async {
    _isLoadingData = true;
    notifyListeners();

    try {
      final response = await http.get(
        Uri.parse('${ApiSettings.url}/orders/'),
        headers: {
          "Authorization": user.token,
      });

      if (response.statusCode == 200) {
        String responseBody = utf8.decode(response.bodyBytes);
        List<dynamic> responseData = json.decode(responseBody);
        _listOrders = responseData.map((json) => Order.fromJson(json)).toList();
        print(responseData);
      }

    } catch (e) {
      print("[ERRO FETCH] ${e}");
    }
    _isLoadingData = false;
    notifyListeners();
  }

  Future<void> createOrder(User user, Order order) async {
    _isLoadingData = true;
    notifyListeners();

    try {
      final response = await http.post(
          Uri.parse('${ApiSettings.url}/orders/'),
          headers: {
            "Authorization": user.token,
          },
          body: {
            "clientEquipment": order.clientEquipment.id.toString(),
            "typeService": order.typeService.id.toString(),
            "DateOrder": order.dateOrder.toString()
          }
      );
    } catch (e) {
      print("[ERROR CREATE] ${e}");
    }
    _isLoadingData = false;
    notifyListeners();
  }

  Future<void> updateOrder(User user, Order order) async {
    _isLoadingData = true;
    notifyListeners();

    try {
      final response = await http.put(
          Uri.parse('${ApiSettings.url}/orders/${order.id}/'),
          headers: {
            "Authorization": user.token,
          },
          body: {
            "clientEquipment": order.clientEquipment.id.toString(),
            "typeService": order.typeService.id.toString(),
            "DateOrder": order.dateOrder
          }
      );
    } catch (e) {
      print("[ERROR UPDATE] ${e}");
    }

    _isLoadingData = false;
    notifyListeners();
  }

  Future<void> deleteOrder(User user, Order order) async {

    try {

      final response = await http.delete(
        Uri.parse('${ApiSettings.url}/orders/${order.id}/'),
        headers: {
          "Authorization": user.token,
        },
      );

    } catch (e) {
      print("[ERROR]: ${e}");
    }

  }

}
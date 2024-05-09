import 'dart:convert';

import 'package:client_admin_panel/model/equipment_model.dart';
import 'package:client_admin_panel/model/user_model.dart';
import 'package:client_admin_panel/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class EquipmentViewModel extends ChangeNotifier {

  List<Equipment> _listEquipments = [];
  List<Equipment>  get listEquipments => _listEquipments;

  bool _isLoadingData = false;
  bool get isLoadingData => _isLoadingData;

  Future<void> fetchAllEquipment(User user) async {
    _isLoadingData = true;
    notifyListeners();
    try {
      final response = await http.get(
        Uri.parse('${ApiSettings.url}/${ApiSettings.clientDomain}/equipments/'),
        headers: {
          "Authorization": user.token,
        }
      );

      if (response.statusCode == 200) {
        String responseBody = utf8.decode(response.bodyBytes);
        List<dynamic> responseData = json.decode(responseBody);
        _listEquipments = responseData.map((json) => Equipment.fromJson(json)).toList();
        print(_listEquipments);
      }
    } catch (e) {
      print("[ERROR]: ${e}");
    }

    _isLoadingData = false;
    notifyListeners();
  }

  Future<void> createNewEquipment(User? user, Equipment equipment) async {
    _isLoadingData = true;
    notifyListeners();

    try {

      final response = await http.post(
          Uri.parse('${ApiSettings.url}/${ApiSettings.clientDomain}/equipments/'),
          headers: {
            "Authorization": user!.token,
          },
          body: {
            'Name': equipment.name,
            "typeEquipment": equipment.typeEquipment.id.toString(),
            "Company": equipment.company,
            "Description": equipment.description
          }
      );

      _isLoadingData = false;
      notifyListeners();
      print(response.body);
    } catch (e) {
      print("[ERROR CREATING]: ${e}");
    }
  }

  Future<void> updateEquipment(User user, Equipment equipment) async {

    _isLoadingData = true;
    notifyListeners();

    try {

      final response = await http.put(
          Uri.parse('${ApiSettings.url}/${ApiSettings.clientDomain}/equipments/${equipment.id}/'),
          headers: {
            "Authorization": user.token,
          },
          body: {
            'Name': equipment.name,
            "typeEquipment": equipment.typeEquipment.id.toString(),
            "Company": equipment.company,
            "Description":  equipment.description
          }
      );

      print(response.body);
    } catch (e) {
      print("[ERROR]: ${e}");
    }

  }

  Future<void> deleteEquipment(User user, Equipment equipment) async {
    _isLoadingData = true;
    notifyListeners();

    try {

      final response = await http.delete(
          Uri.parse('${ApiSettings.url}/${ApiSettings.clientDomain}/equipments/${equipment.id}/'),
          headers: {
            "Authorization": user.token,
          },
      );

      print(response.body);
    } catch (e) {
      print("[ERROR]: ${e}");
    }

  }

}
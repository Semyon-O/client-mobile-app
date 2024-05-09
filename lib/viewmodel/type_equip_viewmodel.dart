import 'dart:convert';

import 'package:client_admin_panel/model/equipment_model.dart';
import 'package:client_admin_panel/settings.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;


class TypeEquipmentViewModel extends ChangeNotifier {

  List<EquipmentType> _listEquipmentTypes = [];
  List<EquipmentType>  get listEquipmentTypes => _listEquipmentTypes;

  Future<void> fetchEquipmentTypes() async {
    try {

      final response = await http.get(
          Uri.parse('${ApiSettings.url}/${ApiSettings.clientDomain}/equipments/types/'),
      );

      if (response.statusCode == 200) {
        String responseBody = utf8.decode(response.bodyBytes);
        List<dynamic> responseData = json.decode(responseBody);
        _listEquipmentTypes = responseData.map((json) => EquipmentType.fromJson(json)).toList();
        print(_listEquipmentTypes);
      }
    } catch (e) {
      print("[ERROR]: ${e}");
    }
  }

}
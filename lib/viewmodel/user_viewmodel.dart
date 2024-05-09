import 'dart:convert';
import 'dart:io';
import 'package:client_admin_panel/model/user_model.dart';
import 'package:client_admin_panel/settings.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';


class UserViewModel extends ChangeNotifier {

  User? _user;
  User? get user => _user;

  late Directory _appDocumentsDirectory;

  Future<bool> authUser(String username, String password) async {

    var authUrl = Uri.parse('${ApiSettings.url}/${ApiSettings.clientDomain}/auth/');

    try {
      var response = await http.post(
          authUrl,
          body: {
            'username': username,
            'password': password,
          }
      );

      if (response.statusCode == 200){
        print(
            response.body
        );
      Map<String, dynamic> responseBodyMap = jsonDecode(response.body);
      User user = User.fromJson(responseBodyMap);
      saveUser(user);
      return true;
      }

    } catch (e) {
      print(e);
    }

    return false;

  }

  Future<bool> registerUser(
      String username,
      String password,
      String first_name,
      String last_name,
      String email
      ) async {

    var authUrl = Uri.parse('${ApiSettings.url}/${ApiSettings.clientDomain}/register/');

    try {
      var response = await http.post(
          authUrl,
          body: {
            'username': username,
            'password': password,
            'first_name': first_name,
            'last_name': last_name,
            'email': email,
          }
      );
      return true;
    }
    catch (e) {
      print(e);
      return false;
    }

  }

  Future<void> saveUser (User user) async {
    _appDocumentsDirectory = await getApplicationDocumentsDirectory();
    File userFile = File('${_appDocumentsDirectory.path}/user.json');

    try {
      // Преобразуем пользователя в JSON и записываем в файл
      String userJson = jsonEncode(user.toJson());
      await userFile.writeAsString(userJson);
      print('Пользователь успешно сохранен в файл');
    } catch (e) {
      print('Ошибка при сохранении пользователя: $e');
    }
  }

  Future<bool> getUser() async {
    try {
      _appDocumentsDirectory = await getApplicationDocumentsDirectory();
      File userFile = File('${_appDocumentsDirectory.path}/user.json');

      // Если файл существует, читаем его содержимое и десериализуем JSON
      if (await userFile.exists()) {
        String userJson = await userFile.readAsString();
        Map<String, dynamic> userMap = jsonDecode(userJson);
        _user = User.fromJson(userMap);
        notifyListeners();
        return true;
      } else {
        _user = null;
        print('Файл пользователя не найден');
        return false;
        // return null;
      }
    } catch (e) {
      print('Ошибка при загрузке пользователя: $e');
      return false;
    }
  }

}
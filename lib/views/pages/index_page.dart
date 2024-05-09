import 'dart:convert';
import 'package:client_admin_panel/model/equipment_model.dart';
import 'package:client_admin_panel/viewmodel/type_equip_viewmodel.dart';
import 'package:client_admin_panel/viewmodel/user_viewmodel.dart';
import 'package:client_admin_panel/views/pages/bt_menu_item_pages/equipment_page.dart';
import 'package:client_admin_panel/views/pages/bt_menu_item_pages/order_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth/login.dart';



class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserViewModel>(
        builder: (context, model, child) {
          Provider.of<UserViewModel>(context, listen: false).getUser();
          if (model.user != null) {
            return MainMenuPage();
          } else {
            return LogInPage();
          }
        }
    );
  }
}


class MainMenuPage extends StatefulWidget {
  const MainMenuPage({super.key});

  @override
  State<MainMenuPage> createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _widgetOptions = <Widget>[
    OrderPage(),
    ListEquipment(),
    Text(
      'Профиль аккаунта',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.description_outlined),
            label: 'Заявки',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dvr_rounded),
            label: 'Оборудования',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Профиль',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

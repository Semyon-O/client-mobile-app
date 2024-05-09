import 'package:client_admin_panel/viewmodel/equipment_viewmodel.dart';
import 'package:client_admin_panel/viewmodel/feedback_viewmodel.dart';
import 'package:client_admin_panel/viewmodel/order_viewmodel.dart';
import 'package:client_admin_panel/viewmodel/type_equip_viewmodel.dart';
import 'package:client_admin_panel/viewmodel/type_service_viewmodel.dart';
import 'package:client_admin_panel/viewmodel/user_viewmodel.dart';
import 'package:client_admin_panel/views/pages/auth/login.dart';
import 'package:client_admin_panel/views/pages/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'views/pages/index_page.dart';

void main() {
  runApp(App());
}


class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserViewModel()),
        ChangeNotifierProvider(create: (context) => EquipmentViewModel()),
        ChangeNotifierProvider(create: (context) => TypeEquipmentViewModel()),
        ChangeNotifierProvider(create: (context) => OrderViewModel()),
        ChangeNotifierProvider(create: (context) => ServiceTypeViewModel()),
        ChangeNotifierProvider(create: (context) => FeedbackViewModel())
      ],
      child: MaterialApp(
        home: IndexPage(),
      ),
    );
  }
}
import 'package:client_admin_panel/model/user_model.dart';
import 'package:client_admin_panel/viewmodel/user_viewmodel.dart';
import 'package:client_admin_panel/views/pages/info_pages/info_feedback_page.dart';
import 'package:client_admin_panel/views/pages/info_pages/order_info_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  late final User _user;

  @override
  void initState(){
    super.initState();
    _user = Provider.of<UserViewModel>(context, listen: false).user!;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                  color: Color.fromRGBO(5, 96, 250, 1),
                  borderRadius: BorderRadius.circular(8)),
                  height: 100,
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      CircleAvatar(),
                      Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Здравствуйте, ${_user.firstName}"),
                            Text("Желаем вам хорошего дня")
                          ],
                        ),
                      )
                    ],
                  )
                ),
                SizedBox(height: 44,),


                Container(
                  padding: EdgeInsets.only(top: 12, bottom: 12),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Container(
                                height: 160,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(0, 2),
                                          blurRadius: 4.0,
                                          spreadRadius: 2.0
                                      ),
                                    ],
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: SvgPicture.asset(
                                        "assets/icons/history_orders.svg",
                                        semanticsLabel: 'history',
                                        height: 80,
                                        width: 80,
                                      ),
                                    ),
                                    Text("История заявок")
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => FeedbackPage(),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 160,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey,
                                            offset: Offset(0, 2),
                                            blurRadius: 4.0,
                                            spreadRadius: 2.0
                                        ),
                                      ]
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: SvgPicture.asset(
                                          "assets/icons/feedback.svg",
                                          semanticsLabel: 'feedback',
                                          height: 80,
                                          width: 80,
                                        ),
                                      ),
                                      Text("Отзывы")
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12,),
                      Padding(
                        padding: const EdgeInsets.only(top: 12, bottom: 12),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Container(
                                    height: 160,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey,
                                              offset: Offset(0, 2),
                                              blurRadius: 4.0,
                                              spreadRadius: 2.0
                                          ),
                                        ]
                                    ),
                                    child: Text("Запланированный список заявок клиентов"),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => ListOrdersPage(),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 160,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(0, 2),
                                          blurRadius: 4.0,
                                          spreadRadius: 2.0
                                        ),
                                      ]
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: SvgPicture.asset(
                                            "assets/icons/created_orders.svg",
                                            semanticsLabel: 'created orders',
                                            height: 80,
                                            width: 80,
                                          ),
                                        ),
                                        Text("Ваши созданные заявки", textAlign: TextAlign.center,)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


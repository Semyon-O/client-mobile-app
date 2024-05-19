import 'package:client_admin_panel/views/pages/index_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../viewmodel/user_viewmodel.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {

  var _usernameController = TextEditingController();
  var _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 24, right: 24, top: 80),
          child: Form(
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Добро пожаловать", style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Roboto",
                          color: Color.fromRGBO(58, 58, 58, 1)
                        ),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Напишите пожалуйста ваш логин",
                          softWrap: false, // TODO: Сделать перенос текста
                          maxLines: 4,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Roboto",
                            color: Color.fromRGBO(167, 167, 167, 1),
                        ),),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 12, bottom: 12),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Text("Логин", style: TextStyle(
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Color.fromRGBO(167, 167, 167, 1)
                              ),),
                              margin: EdgeInsets.only(bottom: 8),
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.start,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _usernameController,
                              decoration: InputDecoration(
                                hintText: "Ваш логин",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(167, 167, 167, 1),
                                    width: 1
                                  )
                                )
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 12, bottom: 12),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Text("Ваш пароль входа", style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Color.fromRGBO(167, 167, 167, 1)
                              ),),
                              margin: EdgeInsets.only(bottom: 8),
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.start,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                  hintText: "**********",
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(167, 167, 167, 1),
                                          width: 1
                                      )
                                  )
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
        
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: InkWell(
                        onTap: () {},
                        child: Text(
                          "Забыли пароль?",
                          style: TextStyle(
                            color: Color.fromRGBO(5, 96, 250, 1),
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        
                SizedBox(height:150),
        
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () async {
                              bool isAuthenticated = await Provider.of<UserViewModel>(context, listen: false)
                                  .authUser(
                                _usernameController.text as String,
                                _passwordController.text as String,
                              );

                              if (isAuthenticated) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => IndexPage()),
                                );
                              }
                            },
                            child: Text('Авторизоваться', style: TextStyle(
                              color: Colors.white
                            ),),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromRGBO(5, 96, 250, 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Text(
                          'Впервые в нашем приложении',
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Text(
                        'Зарестрироваться', // TODO: Сделать inkWel
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}

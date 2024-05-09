import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../viewmodel/user_viewmodel.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

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
                          Expanded(
                            child: Text("Здравствуйте,\nРады вас видеть на нашем сервисе", style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Roboto",
                                color: Color.fromRGBO(58, 58, 58, 1)
                            ),),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Заполните пожалуйста форму регистрацию",
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
                                child: Text("Username", style: TextStyle(
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
                                    hintText: "Enter your username",
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
                                child: Text("Имя", style: TextStyle(
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
                                    hintText: "Введите ваше Имя",
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
                                child: Text("Имя", style: TextStyle(
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
                                    hintText: "Введите вашу фамилию",
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
                                child: Text("Email", style: TextStyle(
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
                                    hintText: "Введите вашу почту",
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
                                child: Text("Пароль", style: TextStyle(
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
                                    hintText: "Введите пароль",
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
                                child: Text("Повторите пароль", style: TextStyle(
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
                                    hintText: "Подтвердите пароль",
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
                            "Forgot Password?",
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

                  SizedBox(height:75),

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
                                    .registerUser(
                                    _usernameController.text as String,
                                    _passwordController.text as String,
                                    "test",
                                    "test",
                                    "test"
                                );

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
                            'Already have an account?',
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Text(
                          'Sign Up', // TODO: Сделать inkWel
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
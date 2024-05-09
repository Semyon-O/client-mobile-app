import 'package:client_admin_panel/model/equipment_model.dart';
import 'package:client_admin_panel/model/user_model.dart';
import 'package:client_admin_panel/viewmodel/equipment_viewmodel.dart';
import 'package:client_admin_panel/viewmodel/type_equip_viewmodel.dart';
import 'package:client_admin_panel/viewmodel/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateNewEquipPage extends StatefulWidget {
  const CreateNewEquipPage({super.key});

  @override
  State<CreateNewEquipPage> createState() => _CreateNewEquipPageState();
}

class _CreateNewEquipPageState extends State<CreateNewEquipPage> {

  List<EquipmentType> _listEquipTypes = [];
  late EquipmentType _selectedTypeEquipment;

  var _nameController = TextEditingController();
  var _companyController = TextEditingController();
  var _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    var typesModel = Provider.of<TypeEquipmentViewModel>(context, listen: false);
    typesModel.fetchEquipmentTypes().then((_) {
      setState(() {
        _listEquipTypes = typesModel.listEquipmentTypes;
        _selectedTypeEquipment = (_listEquipTypes.isNotEmpty ? _listEquipTypes[0] : null)!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: FutureBuilder<void>(
            future: Provider.of<TypeEquipmentViewModel>(context, listen: false).fetchEquipmentTypes(),
            builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator()); // Показываем индикатор загрузки, пока данные загружаются
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 12, bottom: 12),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Text("Наименование", style: TextStyle(
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
                                          controller: _nameController,
                                          decoration: InputDecoration(
                                              hintText: "Введите наименование оборудования",
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
                                          child: Text("Тип оборудования", style: TextStyle(
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
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(4),
                                                border: Border.all(
                                                    color: Color.fromRGBO(167, 167, 167, 1)
                                                )
                                            ),
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton<EquipmentType>(
                                                padding: EdgeInsets.all(4),
                                                value: _selectedTypeEquipment, // Здесь укажите экземпляр EquipmentType
                                                onChanged: (EquipmentType? newValue) { // Здесь используйте EquipmentType
                                                  setState(() {
                                                    _selectedTypeEquipment = newValue!;
                                                  });
                                                },
                                                items: _listEquipTypes.map<DropdownMenuItem<EquipmentType>>((EquipmentType value) {
                                                  return DropdownMenuItem<EquipmentType>(
                                                    value: value, // Используйте экземпляры EquipmentType
                                                    child: Text(value.type),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          )
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
                                          child: Text("Компания", style: TextStyle(
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
                                          controller: _companyController,
                                          decoration: InputDecoration(
                                              hintText: "Напишите, компанию выдавшая вам оборудование",
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
                                          child: Text("Описание", style: TextStyle(
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
                                          maxLines: null,
                                          controller: _descriptionController,
                                          decoration: InputDecoration(
                                              hintText: "Напишите дополнительную информацию",
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
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Align(
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 40,
                                    child: TextButton(
                                      onPressed: () {

                                        Equipment new_equipment = new Equipment(
                                            id: null,
                                            name: _nameController.text,
                                            typeEquipment: _selectedTypeEquipment,
                                            company: _companyController.text,
                                            description: _descriptionController.text
                                        );

                                        User? user = Provider.of<UserViewModel>(context, listen: false).user;
                                        Provider.of<EquipmentViewModel>(context, listen: false)
                                            .createNewEquipment(user, new_equipment);

                                        setState(() {  });
                                        Navigator.pop(context);
                                        showDialog(context: context, builder: (BuildContext context){
                                          return AlertDialog(
                                            title: Text("Запись создана"),
                                            content: Text("Для получения новых записей, нажмите на обновить"),
                                          );
                                        });
                                      },
                                      child: Text("Создать новую запись", style: TextStyle(
                                          color: Colors.white
                                      ),),
                                      style: TextButton.styleFrom(
                                          backgroundColor: Color.fromRGBO(53, 179, 105, 1),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8)
                                          )
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                        )
                      ],
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

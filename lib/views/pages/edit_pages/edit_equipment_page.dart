import 'package:client_admin_panel/model/equipment_model.dart';
import 'package:client_admin_panel/model/user_model.dart';
import 'package:client_admin_panel/viewmodel/equipment_viewmodel.dart';
import 'package:client_admin_panel/viewmodel/type_equip_viewmodel.dart';
import 'package:client_admin_panel/viewmodel/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditEquipPage extends StatefulWidget {

  final Equipment equipment;

  EditEquipPage({super.key, required this.equipment});

  @override
  State<EditEquipPage> createState() => _EditEquipPageState();
}

class _EditEquipPageState extends State<EditEquipPage> {

  late EquipmentType _selectedEquipment;
  late List<EquipmentType> _typesEquipment;
  late User _user;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _companyController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _typesEquipment = Provider.of<TypeEquipmentViewModel>(context, listen: false).listEquipmentTypes;
    _user = Provider.of<UserViewModel>(context, listen: false).user!;

    _nameController.text = widget.equipment.name;
    _companyController.text = widget.equipment.company;
    _descriptionController.text = widget.equipment.description;

    _selectedEquipment = (_typesEquipment.isNotEmpty ? _typesEquipment[0] : null)!; // TODO: Исправить установку типа оборудования

  }

  @override
  void dispose() {
    _nameController.dispose();
    _companyController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
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
                                          value: _selectedEquipment,
                                          onChanged: (EquipmentType? newValue) {
                                            setState(() {
                                              _selectedEquipment = newValue!;
                                            });
                                          },
                                          items: _typesEquipment.map<DropdownMenuItem<EquipmentType>>((EquipmentType value) {
                                            return DropdownMenuItem<EquipmentType>(
                                              value: value,
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
                                        hintText: "Напишите, какую нибудь дополнительную информацию,\nдля ремонта мастерами",
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
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 48,
                            child: TextButton(
                              onPressed: () {
                                EquipmentViewModel equipViewModel = Provider.of<EquipmentViewModel>(context, listen: false);

                                Equipment equipment = new Equipment(
                                    id: widget.equipment.id,
                                    name: _nameController.text,
                                    typeEquipment: _selectedEquipment,
                                    company: _companyController.text,
                                    description: _descriptionController.text,
                                );

                                equipViewModel.updateEquipment(_user, equipment);

                              },
                              child: Text("Изменить", style: TextStyle(
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
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 48,
                            child: TextButton(
                              onPressed: () {
                                EquipmentViewModel equipViewModel = Provider.of<EquipmentViewModel>(context, listen: false);
                                equipViewModel.deleteEquipment(_user, widget.equipment);
                              },
                              child: Text("Удалить", style: TextStyle(
                                  color: Colors.white
                              ),),
                              style: TextButton.styleFrom(
                                  backgroundColor: Color.fromRGBO(237, 58, 58, 1),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)
                                  )
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:client_admin_panel/model/equipment_model.dart';
import 'package:client_admin_panel/views/pages/edit_pages/edit_equipment_page.dart';
import 'package:flutter/material.dart';

class EquipmentInfoPage extends StatelessWidget {
  final Equipment equipment;

  EquipmentInfoPage({required this.equipment});

  @override
  Widget build(BuildContext context) {
    var titleTextStyle = TextStyle(
      color: Color.fromRGBO(167, 167, 167, 1),
      fontFamily: "Roboto",
      fontWeight: FontWeight.w400,
      fontSize: 14,
    );
    var infoTextStyle = TextStyle(
      color: Color.fromRGBO(236, 128, 0, 1),
      fontFamily: "Roboto",
      fontWeight: FontWeight.w400,
      fontSize: 14,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Оборудование №${equipment.id}"),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {

            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Информация об оборудовании",
                      style: TextStyle(
                        color: Color.fromRGBO(5, 96, 250, 1),
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Наименование:", style: titleTextStyle),
                        Expanded(child: Text(equipment.name, style: infoTextStyle, textAlign: TextAlign.right,)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Тип оборудования:", style: titleTextStyle),
                        Expanded(child: Text(equipment.typeEquipment.type, style: infoTextStyle, textAlign: TextAlign.right)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Компания:", style: titleTextStyle),
                        Expanded(child: Text(equipment.company, style: infoTextStyle, textAlign: TextAlign.right)),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Описание оборудования",
                      style: TextStyle(
                        color: Color.fromRGBO(5, 96, 250, 1),
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Text(equipment.description, style: infoTextStyle),
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
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => EditEquipPage(equipment: equipment),
                                ),
                              );
                            },
                            child: Text("Изменить", style: TextStyle(
                              color: Colors.white
                            ),),
                            style: TextButton.styleFrom(
                              backgroundColor: Color.fromRGBO(47, 128, 237, 1),
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
                            onPressed: () { },
                            child: Text("Создать заявку", style: TextStyle(
                              color: Colors.white
                            ),),
                            style: TextButton.styleFrom(
                              backgroundColor: Color.fromRGBO(235, 188, 46, 1),
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
    );
  }
}
import 'package:client_admin_panel/model/equipment_model.dart';
import 'package:client_admin_panel/views/pages/info_pages/info_object_equip_page.dart';
import 'package:flutter/material.dart';


class EquipmentCard extends StatelessWidget {
  final Equipment equipment;

  const EquipmentCard({
    Key? key,
    required this.equipment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => EquipmentInfoPage(equipment: equipment,),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Text("Equipment Name:"),
                  Expanded(child: Text(equipment.name, textAlign: TextAlign.end)),
                ],
              ),
              Row(
                children: [
                  const Text("Type:"),
                  Expanded(child: Text(equipment.typeEquipment.type, textAlign: TextAlign.end)),
                ],
              ),
              Row(
                children: [
                  const Text("Company:"),
                  Expanded(child: Text(equipment.company, textAlign: TextAlign.end)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:client_admin_panel/viewmodel/equipment_viewmodel.dart';
import 'package:client_admin_panel/viewmodel/type_equip_viewmodel.dart';
import 'package:client_admin_panel/viewmodel/user_viewmodel.dart';
import 'package:client_admin_panel/views/common/equipment_card_widget.dart';
import 'package:client_admin_panel/views/pages/edit_pages/create_new_equip_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ListEquipment extends StatefulWidget {
  const ListEquipment({super.key});

  @override
  State<ListEquipment> createState() => _ListEquipmentState();
}

class _ListEquipmentState extends State<ListEquipment> {

  @override
  void initState() {
    super.initState();
    var user = Provider.of<UserViewModel>(context, listen: false).user;
    Provider.of<EquipmentViewModel>(context, listen: false).fetchAllEquipment(user!);
    Provider.of<TypeEquipmentViewModel>(context, listen: false).fetchEquipmentTypes();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () async  {
              var user = Provider.of<UserViewModel>(context, listen: false).user;
              Provider.of<EquipmentViewModel>(context, listen: false).fetchAllEquipment(user!);
            },
          ),
        ],
      ),
      body: Consumer<EquipmentViewModel>(
        builder: (BuildContext context, EquipmentViewModel value, Widget? child) {
          if (value.isLoadingData) {
            return Center(child: CircularProgressIndicator());
          }
          return Container(
            color: Colors.white,
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                        itemCount: value.listEquipments.length,
                        itemBuilder: (context, index) {
                          return EquipmentCard(
                            equipment: value.listEquipments[index],
                          );
                        }
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        child: Container(
                          height: 40,
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => CreateNewEquipPage(),
                                ),
                              );
                            },
                            child:  Text("Внести новое оборудование", style: TextStyle(
                                color: Colors.white
                            ),),
                            style: TextButton.styleFrom(
                              backgroundColor: Color.fromRGBO(47, 128, 237, 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      )
    );
  }
}


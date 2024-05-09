import 'package:client_admin_panel/model/equipment_model.dart';
import 'package:client_admin_panel/model/order_model.dart';
import 'package:client_admin_panel/viewmodel/equipment_viewmodel.dart';
import 'package:client_admin_panel/viewmodel/order_viewmodel.dart';
import 'package:client_admin_panel/viewmodel/type_service_viewmodel.dart';
import 'package:client_admin_panel/viewmodel/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateNewOrderPage extends StatefulWidget {
  const CreateNewOrderPage({super.key});

  @override
  State<CreateNewOrderPage> createState() => _CreateNewOrderPageState();
}

class _CreateNewOrderPageState extends State<CreateNewOrderPage> {

  late Equipment _choosedEquipment;
  late List<Equipment> _equipmentList;

  late ServiceType _choosedTypeService;
  late List<ServiceType> _typeServiceList;

  DateTime _choosedDateOrder = DateTime.now();

  @override
  void initState() {
    super.initState();
    _equipmentList = Provider.of<EquipmentViewModel>(context, listen: false).listEquipments;
    _choosedEquipment = _equipmentList[0];
    _typeServiceList = Provider.of<ServiceTypeViewModel>(context, listen: false).listServiceType;
    _choosedTypeService = _typeServiceList[0];
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
                                    child: Text("Оборудование", style: TextStyle(
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
                                        child: DropdownButton<Equipment>(
                                          padding: EdgeInsets.all(4),
                                          value: _choosedEquipment,
                                          onChanged: (Equipment? newValue) {
                                            setState(() {
                                              _choosedEquipment = newValue!;
                                            });
                                          },
                                          items: _equipmentList.map<DropdownMenuItem<Equipment>>((Equipment value) {
                                            return DropdownMenuItem<Equipment>(
                                              value: value,
                                              child: Text("${value.id}: ${value.name}"),
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
                                    child: Text("Тип сервиса", style: TextStyle(
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
                                        child: DropdownButton<ServiceType>(
                                          padding: EdgeInsets.all(4),
                                          value: _choosedTypeService,
                                          onChanged: (ServiceType? newValue) {
                                            setState(() {
                                              _choosedTypeService = newValue!;
                                            });
                                          },
                                          items: _typeServiceList.map<DropdownMenuItem<ServiceType>>((ServiceType value) {
                                            return DropdownMenuItem<ServiceType>(
                                              value: value,
                                              child: Text(value.name),
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
                        child: CalendarDatePicker(
                          initialDate: null,
                          firstDate: DateTime(2022),
                          lastDate: DateTime(2036),
                          onDateChanged: (DateTime value) {
                            _choosedDateOrder = value;
                          },
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
                      child: TextButton(
                          onPressed: () {
                            var user = Provider.of<UserViewModel>(context, listen: false).user;
                            print("${_choosedDateOrder.year}-${_choosedDateOrder.month}-${_choosedDateOrder.day}");
                            Provider.of<OrderViewModel>(context, listen: false)
                                .createOrder(user!,
                              Order(
                                  id: null,
                                  clientEquipment: ClientEquipment(
                                      id: _choosedEquipment.id,
                                      name: _choosedEquipment.name,
                                      typeEquipment: _choosedEquipment.typeEquipment.type
                                  ),
                                  typeService: _choosedTypeService,
                                  orderStatus: null,
                                  worker: null,
                                  dateOrder: "${_choosedDateOrder.year}-${_choosedDateOrder.month}-${_choosedDateOrder.day}"
                              ));

                            Provider.of<OrderViewModel>(context, listen: false).fetchAllOrders(user); // TODO Сделать при переходе, повторную загрузку данных
                            Navigator.pop(context);
                            showDialog(context: context, builder: (BuildContext context){
                              return AlertDialog(
                                title: Text("Ваша заявка создана"),
                                content: Text("Вам подбирается специалист."),
                              );
                            });
                          },
                          child: Text("Разместить новую заявку")
                      )
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

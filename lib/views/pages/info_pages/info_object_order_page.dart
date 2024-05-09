import 'package:client_admin_panel/model/order_model.dart';
import 'package:client_admin_panel/viewmodel/order_viewmodel.dart';
import 'package:client_admin_panel/viewmodel/type_service_viewmodel.dart';
import 'package:client_admin_panel/viewmodel/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditingOrderPage extends StatefulWidget {

  final Order order;

  const EditingOrderPage({super.key, required this.order});

  @override
  State<EditingOrderPage> createState() => _EditingOrderPageState();
}

class _EditingOrderPageState extends State<EditingOrderPage> {

  late ClientEquipment _choosedEquipment;

  late ServiceType _choosedTypeService;
  late List<ServiceType> _typeServiceList;

  late DateTime _choosedDateOrder;

  @override
  void initState() {
    super.initState();
    _choosedEquipment = widget.order.clientEquipment;
    _typeServiceList = Provider.of<ServiceTypeViewModel>(context, listen: false).listServiceType;
    _choosedTypeService = _typeServiceList[0];
    _choosedDateOrder = DateTime.parse(widget.order.dateOrder);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
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
                                  child: Text("Оборудование:", style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: Color.fromRGBO(167, 167, 167, 1)
                                  ),),
                                  margin: EdgeInsets.only(bottom: 8),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Text("${_choosedEquipment.name}", style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: Color.fromRGBO(236, 128, 0, 1)
                                  ),),
                                  margin: EdgeInsets.only(bottom: 8),
                                ),
                              ),
                            ],
                          ),
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
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 48,
                          child: TextButton(
                            onPressed: () {
                                var user = Provider.of<UserViewModel>(context, listen: false).user;
                                print("${_choosedDateOrder.year}-${_choosedDateOrder.month}-${_choosedDateOrder.day}");
                                Provider.of<OrderViewModel>(context, listen: false)
                                  .updateOrder(user!, Order(
                                    id: widget.order.id,
                                    clientEquipment: _choosedEquipment,
                                    typeService: widget.order.typeService,
                                    orderStatus: widget.order.orderStatus,
                                    worker: widget.order.worker,
                                    dateOrder: "${_choosedDateOrder.year}-${_choosedDateOrder.month}-${_choosedDateOrder.day}"
                                  )
                                );

                                Navigator.pop(context);
                                showDialog(context: context, builder: (BuildContext context){
                                  return AlertDialog(
                                    title: Text("Ваша заявка была обновлена"),
                                    content: Text("Информация о заявке была изменена. Она отобразиться после обновления"),
                                  );
                                });

                              },
                            child: Text("Обновить", style: TextStyle(
                                color: Colors.white
                            ),),
                            style:TextButton.styleFrom(
                                backgroundColor: Color.fromRGBO(5, 96, 250, 1),
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
                              var user = Provider.of<UserViewModel>(context, listen: false).user;
                              print("${_choosedDateOrder.year}-${_choosedDateOrder.month}-${_choosedDateOrder.day}");
                              Provider.of<OrderViewModel>(context, listen: false)
                                  .deleteOrder(user!, widget.order);

                              Navigator.pop(context);
                              showDialog(context: context, builder: (BuildContext context){
                                return AlertDialog(
                                  title: Text("Ваша заявка была отменена"),
                                );
                              });

                            },
                            child: Text("Отменить", style: TextStyle(
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
    );
  }
}
import 'package:client_admin_panel/model/order_model.dart';
import 'package:client_admin_panel/viewmodel/order_viewmodel.dart';
import 'package:client_admin_panel/viewmodel/type_service_viewmodel.dart';
import 'package:client_admin_panel/viewmodel/user_viewmodel.dart';
import 'package:client_admin_panel/views/pages/edit_pages/create_new_feedback.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryOrderPage extends StatefulWidget {

  final Order order;

  const HistoryOrderPage({super.key, required this.order});

  @override
  State<HistoryOrderPage> createState() => _HistoryOrderPageState();
}

class _HistoryOrderPageState extends State<HistoryOrderPage> {

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
                                  child: Text("Тип сервиса:", style: TextStyle(
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
                                  child: Text("${_choosedTypeService.name}", style: TextStyle(
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
                      child: CalendarDatePicker(
                        initialDate: _choosedDateOrder,
                        firstDate: DateTime(2022),
                        lastDate: DateTime(2036),
                        onDateChanged: (DateTime value) { },
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
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ReviewPage(id_order: widget.order.id,),
                                ),
                              );
                            },
                            child: Text("Оставить отзыв", style: TextStyle(
                                color: Color.fromRGBO(5, 96, 250, 1)
                            ),),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: BorderSide(
                                    color: Color.fromRGBO(5, 96, 250, 1)
                                  ),
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
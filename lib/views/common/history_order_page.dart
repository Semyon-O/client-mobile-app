import 'package:client_admin_panel/model/order_model.dart';
import 'package:client_admin_panel/views/pages/info_pages/info_object_history_order_page.dart';
import 'package:client_admin_panel/views/pages/info_pages/info_object_order_page.dart';
import 'package:flutter/material.dart';

class HistoryOrderCard extends StatelessWidget {
  final Order order;

  const HistoryOrderCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => HistoryOrderPage(order: order,),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text("Заявка №:"),
                  Expanded(child: Text("${order.id}", textAlign: TextAlign.end)),
                ],
              ),
              Row(
                children: [
                  const Text("Наименование оборуд.:"),
                  Expanded(child: Text("${order.clientEquipment.name}", textAlign: TextAlign.end)),
                ],
              ),
              Row(
                children: [
                  const Text("Тип оборуд.:"),
                  Expanded(child: Text("${order.clientEquipment.typeEquipment}", textAlign: TextAlign.end)),
                ],
              ),
              Row(
                children: [
                  const Text("Тип услуги:"),
                  Expanded(child: Text("${order.typeService.name}", textAlign: TextAlign.end)),
                ],
              ),
              Row(
                children: [
                  const Text("Статус заявки::"),
                  Expanded(child: Text("${order.orderStatus?.name}", textAlign: TextAlign.end)),
                ],
              ),
              Row(
                children: [
                  const Text("ФИО мастера:"),
                  Expanded(child: Text("${order.worker?.firstName} ${order.worker?.lastName}", textAlign: TextAlign.end)),
                ],
              ),
              Row(
                children: [
                  const Text("Телефон мастера:"),
                  Expanded(child: Text("${order.worker?.phone}", textAlign: TextAlign.end)),
                ],
              ),
              Row(
                children: [
                  Text("Дата исполнения:"),
                  Expanded(child: Text("${order.dateOrder}", textAlign: TextAlign.end)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
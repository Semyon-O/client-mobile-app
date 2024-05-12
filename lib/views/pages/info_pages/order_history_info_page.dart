import 'package:client_admin_panel/viewmodel/equipment_viewmodel.dart';
import 'package:client_admin_panel/viewmodel/order_viewmodel.dart';
import 'package:client_admin_panel/viewmodel/type_service_viewmodel.dart';
import 'package:client_admin_panel/viewmodel/user_viewmodel.dart';
import 'package:client_admin_panel/views/common/history_order_page.dart';
import 'package:client_admin_panel/views/common/order_card_widget.dart';
import 'package:client_admin_panel/views/pages/edit_pages/create_order_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListHistoryOrdersPage extends StatefulWidget {
  const ListHistoryOrdersPage({super.key});

  @override
  State<ListHistoryOrdersPage> createState() => _ListHistoryOrdersPageState();
}

class _ListHistoryOrdersPageState extends State<ListHistoryOrdersPage> {

  @override
  void initState(){
    super.initState();
    var user = Provider.of<UserViewModel>(context, listen: false).user;
    Provider.of<EquipmentViewModel>(context, listen: false).fetchAllEquipment(user!);
    Provider.of<OrderViewModel>(context, listen: false).fetchHistoryOrders(user);
    Provider.of<ServiceTypeViewModel>(context, listen: false).fetchServiceTypes();
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
              Provider.of<OrderViewModel>(context, listen: false).fetchHistoryOrders(user!);
            },
          )
        ],
      ),
      body: Consumer<OrderViewModel>(builder: (BuildContext context, OrderViewModel value, Widget? child) {
        if (value.isLoadingData) {
          return (Center(child: CircularProgressIndicator(),));
        }
        return Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: ListView.builder(
                    itemCount: value.historyListOrders.length,
                    itemBuilder: (context, index) {
                      return HistoryOrderCard(order: value.historyListOrders[index]);
                    }
                ),
              ),
            ),
          ],
        );
      },
      ),
    );
  }
}

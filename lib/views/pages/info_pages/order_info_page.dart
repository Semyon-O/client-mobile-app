import 'package:client_admin_panel/viewmodel/equipment_viewmodel.dart';
import 'package:client_admin_panel/viewmodel/order_viewmodel.dart';
import 'package:client_admin_panel/viewmodel/type_service_viewmodel.dart';
import 'package:client_admin_panel/viewmodel/user_viewmodel.dart';
import 'package:client_admin_panel/views/common/order_card_widget.dart';
import 'package:client_admin_panel/views/pages/edit_pages/create_order_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListOrdersPage extends StatefulWidget {
  const ListOrdersPage({super.key});

  @override
  State<ListOrdersPage> createState() => _ListOrdersPageState();
}

class _ListOrdersPageState extends State<ListOrdersPage> {

  @override
  void initState(){
    super.initState();
    var user = Provider.of<UserViewModel>(context, listen: false).user;
    Provider.of<EquipmentViewModel>(context, listen: false).fetchAllEquipment(user!);
    Provider.of<OrderViewModel>(context, listen: false).fetchAllOrders(user);
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
              Provider.of<OrderViewModel>(context, listen: false).fetchAllOrders(user!);
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
                    itemCount: value.listOrders.length,
                    itemBuilder: (context, index) {
                      return OrderCard(order: value.listOrders[index]);
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
                              builder: (context) => CreateNewOrderPage(),
                            ),
                          );
                        },
                        child:  Text("Создать новую заявку", style: TextStyle(
                            color: Colors.white
                        ),),
                        style: TextButton.styleFrom(
                          backgroundColor: Color.fromRGBO(53, 179, 105, 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        );
      },
      ),
    );
  }
}

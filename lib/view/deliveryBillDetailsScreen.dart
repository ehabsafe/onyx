import 'package:flutter/material.dart';
import 'package:onyx_delivery_service/data/remote/response/status.dart';
import 'package:onyx_delivery_service/models/deliveryBillItems.dart';
import 'package:onyx_delivery_service/utils/theme.dart';
import 'package:onyx_delivery_service/view_model/home/deliveryBillItemsVM.dart';
import 'package:onyx_delivery_service/widget/loadingWidget.dart';
import 'package:provider/provider.dart';

class DeliveryBillDetailsScreen extends StatefulWidget {
  const DeliveryBillDetailsScreen({Key? key, this.billsrl}) : super(key: key);
  final String? billsrl;
  @override
  State<DeliveryBillDetailsScreen> createState() =>
      _DeliveryBillDetailsScreenState();
}

class _DeliveryBillDetailsScreenState extends State<DeliveryBillDetailsScreen> {
  final DeliveryBillItemsVM viewModel = DeliveryBillItemsVM();
  String? billsrl;

  @override
  void initState() {
    setState(() {
      billsrl = widget.billsrl;
    });
    viewModel.fetchDeliveryBills(billsrl!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Delivery Details'),
      ),
      body: ChangeNotifierProvider<DeliveryBillItemsVM>.value(
        value: viewModel,
        child: Consumer<DeliveryBillItemsVM>(builder: (context, viewModel, _) {
          switch (viewModel.deliveryBill.status) {
            case Status.LOADING:
              print("MARAJ :: LOADING");
              return Container(child: LoadingWidget());
            case Status.ERROR:
              print("MARAJ :: ERROR");
              return Text(viewModel.deliveryBill.message ?? "NA");
            case Status.COMPLETED:
              print("MARAJ :: COMPLETED");
              return _getListView(viewModel.deliveryBill.data!);
            default:
          }
          return Container();
        }),
      ),
    );
  }

  Widget _getListView(DeliveryBillsDetails? deliveryBillsList) {
    return ListView.builder(
        padding: EdgeInsets.only(top: 20),
        itemCount: deliveryBillsList!.data!.deliveryBillItems!.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            surfaceTintColor: Colors.transparent,
            child: ListTile(
              title: Text(
                  deliveryBillsList.data!.deliveryBillItems![index].I_NM
                      .toString(),
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              subtitle: Row(
                children: [
                  Text(
                    "Price",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(deliveryBillsList.data!.deliveryBillItems![index].I_PRICE
                      .toString()),
                ],
              ),
              trailing: Text(deliveryBillsList
                  .data!.deliveryBillItems![index].MOBILE_NO
                  .toString()),
            ),
          );
        });
  }
}

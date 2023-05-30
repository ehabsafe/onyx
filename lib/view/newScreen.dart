import 'package:flutter/material.dart';
import 'package:onyx_delivery_service/data/remote/response/status.dart';
import 'package:onyx_delivery_service/models/deliveryBill.dart';
import 'package:onyx_delivery_service/utils/dbhelper.dart';
import 'package:onyx_delivery_service/utils/globalclass.dart';
import 'package:onyx_delivery_service/utils/theme.dart';
import 'package:onyx_delivery_service/view/deliveryBillDetailsScreen.dart';
import 'package:onyx_delivery_service/view_model/home/deliveryBillVM.dart';
import 'package:onyx_delivery_service/widget/loadingWidget.dart';
import 'package:provider/provider.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({Key? key}) : super(key: key);

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  final DeliveryBillsVM viewModel = DeliveryBillsVM();
  DBHelper? dbHelper = DBHelper();

  insertDb(List<DeliveryBill>? dev) {
    dbHelper!.delete();
    dbHelper!.insert(dev);
  }

  @override
  void initState() {
    viewModel.fetchDeliveryBills();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChangeNotifierProvider<DeliveryBillsVM>.value(
        value: viewModel,
        child: Consumer<DeliveryBillsVM>(builder: (context, viewModel, _) {
          switch (viewModel.deliveryBill.status) {
            case Status.LOADING:
              print("MARAJ :: LOADING");
              return Container(
                  height: MediaQuery.of(context).size.height / 1.5,
                  child: LoadingWidget());
            case Status.ERROR:
              print("MARAJ :: ERROR");
              return Text(viewModel.deliveryBill.message ?? "NA");
            case Status.COMPLETED:
              print("MARAJ :: COMPLETED");
              insertDb(viewModel.deliveryBill.data!.data!.deliveryBillItems);
              return _getListView(viewModel.deliveryBill.data!);
            default:
          }
          return Container();
        }),
      ),
    );
  }

  Widget _getListView(AllDeliveryBills? deliveryBillsList) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.5,
      child: ListView.builder(
          padding: EdgeInsets.only(top: 20),
          itemCount: deliveryBillsList!.data!.deliveryBillItems!.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DeliveryBillDetailsScreen(billsrl: deliveryBillsList.data!.deliveryBillItems![index].BILL_SRL,)),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                child: Card(
                  surfaceTintColor: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(deliveryBillsList
                                  .data!.deliveryBillItems![index].BILL_SRL
                                  .toString()),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Text("Status"),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "New",
                                        style: TextStyle(color: greenColor),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    children: [
                                      Text("Total Price"),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        GlobalClass.Price(deliveryBillsList.data!
                                            .deliveryBillItems![index].BILL_AMT
                                            .toString()),
                                        style: TextStyle(color: greenColor),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    children: [
                                      Text("Date"),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        deliveryBillsList.data!
                                            .deliveryBillItems![index].BILL_DATE
                                            .toString(),
                                        style: TextStyle(color: greenColor),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 100,
                          width: 80,
                          decoration: BoxDecoration(
                            color: greenColor,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                          ),
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 5.0, left: 5.0),
                              child: Text(
                                "Order Details >",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

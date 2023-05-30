import 'package:flutter/material.dart';
import 'package:onyx_delivery_service/models/deliveryBill.dart';
import 'package:onyx_delivery_service/utils/theme.dart';
import 'package:onyx_delivery_service/utils/dbhelper.dart';
import 'package:onyx_delivery_service/utils/globalclass.dart';
import 'package:onyx_delivery_service/view_model/home/deliveryBillVM.dart';
import 'package:provider/provider.dart';

class FillterScreen extends StatefulWidget {
  const FillterScreen({Key? key}) : super(key: key);

  @override
  State<FillterScreen> createState() => _FillterScreenState();
}

class _FillterScreenState extends State<FillterScreen> {
  DBHelper? dbHelper = DBHelper();
  final _debouncer = Debouncer();

  List<DeliveryBill> dlist = [];
  List<DeliveryBill> devLists = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<DeliveryBillsVM>(context);

    return Material(
      color: Colors.white,
      child: FutureBuilder(
          future: cart.getDataFromDb(),
          builder: (context, AsyncSnapshot<List<DeliveryBill>> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) {
                return Container();
              } else {
                return Scaffold(
                    appBar: AppBar(
                      backgroundColor: primaryColor,
                      title:
                          Text('Filter'),
                      bottom: PreferredSize(
                        preferredSize: const Size.fromHeight(40.0),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 20.0, left: 20.0, bottom: 10.0),
                          child: SizedBox(
                            height: 35,
                            child: TextField(
                              onChanged: (string) {
                                _debouncer.run(() {
                                  setState(() {
                                    devLists = snapshot.data!
                                        .where(
                                          (u) => (u.CSTMR_NM
                                                  .toString()
                                                  .toLowerCase()
                                                  .toLowerCase()
                                                  .contains(
                                                      string.toLowerCase()) ||
                                              u.RGN_NM
                                                  .toString()
                                                  .toLowerCase()
                                                  .contains(
                                                      string.toLowerCase()) ||
                                              u.MOBILE_NO
                                                  .toString()
                                                  .toLowerCase()
                                                  .toLowerCase()
                                                  .contains(
                                                      string.toLowerCase())),
                                        )
                                        .toList();
                                  });
                                });
                              },
                              textInputAction: TextInputAction.search,
                              decoration: InputDecoration(
                                filled: true, //<-- SEE HERE
                                fillColor: Colors.grey.shade100,
                                contentPadding: const EdgeInsets.all(0),
                                hintText: "Search",
                                isDense: true,
                                alignLabelWithHint: true,
                                isCollapsed: false,

                                prefixIcon: Icon(
                                  Icons.search,
                                  size: 20,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: const BorderSide(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //title:
                    ),
/*
                  body: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                          child: InkWell(
                            onTap: (){

                            },
                            child: Card(
                              surfaceTintColor: Colors.transparent,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(snapshot.data![index].BILL_SRL
                                              .toString()),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Text("Status"),
                                                  Text(
                                                    "New",
                                                    style: TextStyle(color: Colors.green),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Column(
                                                children: [
                                                  Text("Total Price"),
                                                  Text(
                                                    GlobalClass.Price(snapshot.data![index].BILL_AMT
                                                        .toString()),
                                                    style: TextStyle(color: Colors.green),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Column(
                                                children: [
                                                  Text("Date"),
                                                  Text(
                                                    snapshot.data![index].BILL_DATE
                                                        .toString(),
                                                    style: TextStyle(color: Colors.green),
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
                                        color: Colors.green,
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
                  */
                    body: devLists.isNotEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            padding: EdgeInsets.all(5),
                            itemCount: devLists.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                surfaceTintColor: Colors.transparent,
                                elevation: 1,
                                margin: const EdgeInsets.symmetric(vertical: 2),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, bottom: 8.0),
                                  child: ListTile(
                                    onTap: () {},
                                    title: Text(
                                      devLists[index].CSTMR_NM.toString(),
                                    ),
                                    subtitle: Text(
                                      devLists[index].RGN_NM.toString(),
                                    ),
                                    trailing: Text(
                                      devLists[index].MOBILE_NO.toString(),
                                      style: TextStyle(color: Colors.green),
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        : Center(
                            child: Text(
                              'No results found',
                            ),
                          ));
              }
            }
            return Text('');
          }),
    );
  }
}

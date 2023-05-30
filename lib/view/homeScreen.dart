import 'dart:async';

import 'package:flutter/material.dart';

import 'package:onyx_delivery_service/utils/theme.dart';
import 'package:onyx_delivery_service/view/homeToggleTab.dart';
import 'package:onyx_delivery_service/view/loginScreen.dart';
import 'package:onyx_delivery_service/view_model/home/loginVM.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? _timer;
  String name = " ";

  void _startTimer() {
    _timer = Timer(Duration(minutes: 2), () {
      // إذا لم يتم لمس التطبيق خلال فترة زمنية محددة، يجب إعادة العودة إلى صفحة تسجيل الدخول
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  void _resetTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _startTimer();
    }
  }

  void getName() async {
    var ma = await secureStorage.getDeliveryName() ?? '';

    setState(() {
      name = ma;
    });
  }

  @override
  void initState() {
    super.initState();
    // يجب بدء العداد عند تحميل التطبيق
    _startTimer();
    getName();
  }

  @override
  void dispose() {
    super.dispose();
    // يجب إلغاء العداد عند تفريغ التطبيق
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // يجب إعادة تعيين العداد عند لمس التطبيق
          _resetTimer();
        },
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            header(),
            HomeToggleTab(),
          ],
        ),
      ),
    );
  }

  Widget header() {
    return Container(
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          )),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0, left: 12.0, top: 35),
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              child: Center(
                child: Text(
                  name.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.height / 5,
              decoration: BoxDecoration(
                  color: secondryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(150),
                  )),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              "assets/images/box.png",
              height: MediaQuery.of(context).size.height / 5,
              width: MediaQuery.of(context).size.width / 4,
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onyx_delivery_service/utils/theme.dart';
import 'package:onyx_delivery_service/view/splashScreen.dart';
import 'package:onyx_delivery_service/view_model/home/deliveryBillVM.dart';
import 'package:onyx_delivery_service/view_model/home/loginVM.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => DeliveryBillsVM()),
    ChangeNotifierProvider(create: (context) => LoginVM()),
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onyx Delivery Service',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
          useMaterial3: true,
          appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(color: Colors.white),
              titleTextStyle: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold))),
      home: const SplashScreen(),
      //home: const LoginScreen(),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:onyx_delivery_service/utils/theme.dart';
import 'package:onyx_delivery_service/utils/globalclass.dart';
import 'package:onyx_delivery_service/view_model/home/loginVM.dart';
import 'package:onyx_delivery_service/widget/customTextField.dart';
import 'package:onyx_delivery_service/widget/roundButton.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String userId = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.zero,
      children: [
        header(),
        SizedBox(
          height: 50,
        ),
        loginMethod(),
        SizedBox(
          height: 30,
        ),
        footer()
      ],
    ));
  }

  Widget header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Image.asset(

            "assets/images/logowhite.png",
           height: MediaQuery.of(context).size.height / 4.8,
            width: MediaQuery.of(context).size.width / 2,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 4.8,
          width: MediaQuery.of(context).size.width / 4,
          decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(150),
              )),
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.language,
                color: Colors.white,
              )),
        ),
      ],
    );
  }

  Widget loginMethod() {
    final viewModel = Provider.of<LoginVM>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Welcome Back !',
            style: TextStyle(fontSize: 35, color: secondryColor)),
        SizedBox(
          height: 10,
        ),
        Text('Login back into your account',
            style: TextStyle(fontSize: 15, color: secondryColor)),
        SizedBox(
          height: 30,
        ),
        CustomTextField(
          hintText: 'User ID',
          keyboardType: TextInputType.number,
          enabled: true,
          onChanged: (value) {
            userId = value != '' ? value : '';
          },
        ),
        CustomTextField(
          hintText: 'Password',
          keyboardType: TextInputType.text,
          enabled: true,
          onChanged: (value) {
            password = value != '' ? value : '';
          },
        ),
        CustomButton(
          title: 'Log In',
          loading: viewModel.loading,
          onPress: () {
            if (userId.isEmpty) {
              print('Please enter User Id');
              GlobalClass.showToast('Please enter User Id', primaryColor);
            } else if (password.isEmpty) {
              print('Please enter password');
              GlobalClass.showToast('Please enter password', primaryColor);
            } else {
              viewModel.loginApi(userId, password, context);
            }
          },
        ),
      ],
    );
  }

  Widget footer() {
    return Container(
      child: Image.asset(
        "assets/images/van.png",
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}

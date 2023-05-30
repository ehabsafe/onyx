import 'package:flutter/material.dart';
import 'package:onyx_delivery_service/utils/theme.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;
  const CustomButton({
    Key? key,
    required this.title,
    this.loading = false,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: SizedBox(
        height: 40,
        child: Container(
          width: MediaQuery.of(context).size.width-30,
          decoration: BoxDecoration(
              color: secondryColor, borderRadius: BorderRadius.circular(20)),
          child: Center(
              child: loading
                  ? CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Text(
                      title,
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
                    )),
        ),
      ),
    );
  }
}

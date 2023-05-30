import 'package:flutter/material.dart';

import 'package:onyx_delivery_service/repository/login/loginRepoImp.dart';
import 'package:onyx_delivery_service/utils/globalclass.dart';
import 'package:onyx_delivery_service/utils/secureStorge.dart';
import 'package:onyx_delivery_service/utils/theme.dart';
import 'package:onyx_delivery_service/view/homeScreen.dart';

final SecureStorage secureStorage = SecureStorage();

class LoginVM extends ChangeNotifier {
  final _myRepo = LoginRepoImp();

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(
      String userId, String password, BuildContext context) async {
    setLoading(true);

    _myRepo.getUser(userId, password).then((value) async {
      if (value!.result!.ErrNo == 0) {
        setLoading(false);
        await secureStorage
            .setDeliveryName(value.data!.DeliveryName.toString());
        await secureStorage.setUserId(userId.toString());

        GlobalClass.showToast('Login Successfully', secondryColor);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        setLoading(false);
        GlobalClass.showToast(value.result!.ErrMsg.toString(), primaryColor);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      GlobalClass.showToast('Login failed', primaryColor);
    });
  }
}

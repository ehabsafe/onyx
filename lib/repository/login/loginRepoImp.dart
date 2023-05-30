import 'package:onyx_delivery_service/data/remote/network/apiEndPoints.dart';
import 'package:onyx_delivery_service/data/remote/network/baseApiService.dart';
import 'package:onyx_delivery_service/data/remote/network/networkApiService.dart';
import 'package:onyx_delivery_service/models/user.dart';
import 'package:onyx_delivery_service/repository/login/loginRepo.dart';

class LoginRepoImp implements LoginRepo {
  BaseApiService _apiService = NetworkApiService();

  @override
  Future<User?> getUser(String userId, String password) async {
    try {
      dynamic response =  await _apiService.getResponseLogin(
          ApiEndPoints().login, userId, password);
      final jsonData = User.fromJson(response);

      return jsonData;
    } catch (e) {
      print("MARAJ-E $e}");
      throw e;
    }
  }
}

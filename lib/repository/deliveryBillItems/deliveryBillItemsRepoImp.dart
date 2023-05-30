import 'package:onyx_delivery_service/data/remote/network/apiEndPoints.dart';
import 'package:onyx_delivery_service/data/remote/network/baseApiService.dart';
import 'package:onyx_delivery_service/data/remote/network/networkApiService.dart';
import 'package:onyx_delivery_service/models/deliveryBillItems.dart';
import 'package:onyx_delivery_service/repository/deliveryBillItems/deliveryBillItemsRepo.dart';

class DeliveryBillItemsRepoImp implements DeliveryBillItemsRepo {
  BaseApiService _apiService = NetworkApiService();

  @override
  Future<DeliveryBillsDetails?> getDeliveryBillsDetails(String billsrl) async {
    try {
      dynamic response =
          await _apiService.getDetailsResponse(ApiEndPoints().getDeliveryBillsItems,billsrl);
      final jsonData = DeliveryBillsDetails.fromJson(response);
      print("MARAJ $jsonData");
      return jsonData;
    } catch (e) {
      print("MARAJ-E $e}");
      throw e;
    }
  }
}

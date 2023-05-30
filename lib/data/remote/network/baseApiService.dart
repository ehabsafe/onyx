abstract class BaseApiService {

  final String baseUrl = "http://mapp.yemensoft.net/OnyxDeliveryService/Service.svc/";

  Future<dynamic> getResponse(String url);
  Future<dynamic> getDetailsResponse(String url,String billsrl);

  Future<dynamic> getResponseLogin(String url,String userId,String password);

}


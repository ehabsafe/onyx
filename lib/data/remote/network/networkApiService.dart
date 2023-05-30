import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:onyx_delivery_service/data/remote/appException.dart';
import 'package:onyx_delivery_service/data/remote/network/baseApiService.dart';
import 'package:onyx_delivery_service/view_model/home/loginVM.dart';

class NetworkApiService extends BaseApiService {
  Future getResponse(String url) async {
    dynamic responseJson;

    String userId = await secureStorage.getUserId() ?? '';
    try {
      final response = await http.post(
        Uri.parse(baseUrl + url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "Value": {
            "P_DLVRY_NO": userId,
            "P_LANG_NO": "2",
            "P_BILL_SRL": "",
            "P_PRCSSD_FLG": ""
          }
        }),
      );

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  Future getDetailsResponse(String url, String billsrl) async {
    dynamic responseJson;
    String userId = await secureStorage.getUserId() ?? '';

    try {
      final response = await http.post(
        Uri.parse(baseUrl + url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "Value": {
            "P_DLVRY_NO": userId,
            "P_LANG_NO": "2",
            "P_BILL_SRL": billsrl,
            "P_PRCSSD_FLG": ""
          }
        }),
      );

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  Future getResponseLogin(String url, String userId, String password) async {
    dynamic responseJson;
    try {
      final response = await http.post(
        Uri.parse(baseUrl + url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "Value": {
            "P_LANG_NO": "2",
            "P_DLVRY_NO": userId,
            "P_PSSWRD": password
          }
        }),
      );

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);

        return responseJson;
      case 400:
        throw BadRequestException(response.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }
}

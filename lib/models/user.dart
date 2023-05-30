
import 'package:onyx_delivery_service/models/resault.dart';

class User extends Object {
  Delivery? data;
  Result? result;
  User({this.data, this.result});

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    Delivery data = Delivery();
    Result result = Result();
    return User(
        data: parsedJson['Data'] != null
            ? Delivery.fromJson(parsedJson['Data'])
            : data,
        result: parsedJson['Result'] != null
            ? Result.fromJson(parsedJson['Result'])
            : result);
  }
}

class Delivery{
  String? DeliveryName;

  Delivery({this.DeliveryName});

  factory Delivery.fromJson(Map<String, dynamic> parsedJson){
    return Delivery(
      DeliveryName: parsedJson['DeliveryName'],
    );
  }

}
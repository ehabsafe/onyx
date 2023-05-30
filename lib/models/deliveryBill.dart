import 'package:onyx_delivery_service/models/resault.dart';

class AllDeliveryBills extends Object {
  Data? data;
  Result? result;
  AllDeliveryBills({this.data, this.result});

  factory AllDeliveryBills.fromJson(Map<String, dynamic> parsedJson) {
    Data data = Data();
    Result result = Result();
    return AllDeliveryBills(
        data: parsedJson['Data'] != null
            ? Data.fromJson(parsedJson['Data'])
            : data,
        result: parsedJson['Result'] != null
            ? Result.fromJson(parsedJson['Result'])
            : result);
  }
}

class Data extends Object {
  List<DeliveryBill>? deliveryBillItems;

  Data({this.deliveryBillItems});

  factory Data.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['DeliveryBills'] as List;
    List<DeliveryBill> dev =
        list.map((i) => DeliveryBill.fromJson(i)).toList();

    return Data(deliveryBillItems: dev);
  }
}

class DeliveryBill {
  DeliveryBill({
    this.BILL_AMT,
    this.BILL_DATE,
    this.BILL_NO,
    this.BILL_SRL,
    this.BILL_TIME,
    this.BILL_TYPE,
    this.CSTMR_ADDRSS,
    this.CSTMR_APRTMNT_NO,
    this.CSTMR_BUILD_NO,
    this.CSTMR_FLOOR_NO,
    this.CSTMR_NM,
    this.DLVRY_STATUS_FLG,
    this.LATITUDE,
    this.LONGITUDE,
    this.MOBILE_NO,
    this.RGN_NM,
    this.TAX_AMT,
  });

  String? BILL_AMT;
  String? BILL_DATE;
  String? BILL_NO;
  String? BILL_SRL;
  String? BILL_TIME;
  String? BILL_TYPE;
  String? CSTMR_ADDRSS;
  String? CSTMR_APRTMNT_NO;
  String? CSTMR_BUILD_NO;
  String? CSTMR_FLOOR_NO;
  String? CSTMR_NM;
  String? DLVRY_STATUS_FLG;
  String? LATITUDE;
  String? LONGITUDE;
  String? MOBILE_NO;
  String? RGN_NM;
  String? TAX_AMT;

  factory DeliveryBill.fromJson(Map<String, dynamic> json) =>
      DeliveryBill(
        BILL_NO: json["BILL_NO"] == null ? "" : json["BILL_NO"],
        BILL_SRL: json["BILL_SRL"] == null ? "" : json["BILL_SRL"],
        BILL_AMT: json["BILL_AMT"] == null ? "" : json["BILL_AMT"],
        BILL_DATE: json["BILL_DATE"] == null ? "" : json["BILL_DATE"],
        BILL_TIME: json["BILL_TIME"] == null ? "" : json["BILL_TIME"],
        BILL_TYPE: json["BILL_TYPE"] == null ? "" : json["BILL_TYPE"],
        CSTMR_ADDRSS: json["CSTMR_ADDRSS"] == null ? "" : json["CSTMR_ADDRSS"],
        CSTMR_APRTMNT_NO:
            json["CSTMR_APRTMNT_NO"] == null ? "" : json["CSTMR_APRTMNT_NO"],
        CSTMR_BUILD_NO:
            json["CSTMR_BUILD_NO"] == null ? "" : json["CSTMR_BUILD_NO"],
        CSTMR_FLOOR_NO:
            json["CSTMR_FLOOR_NO"] == null ? "" : json["CSTMR_FLOOR_NO"],
        CSTMR_NM: json["CSTMR_NM"] == null ? "" : json["CSTMR_NM"],
        DLVRY_STATUS_FLG:
            json["DLVRY_STATUS_FLG"] == null ? "" : json["DLVRY_STATUS_FLG"],
        LATITUDE: json["LATITUDE"] == null ? "" : json["LATITUDE"],
        LONGITUDE: json["LONGITUDE"] == null ? "" : json["LONGITUDE"],
        MOBILE_NO: json["MOBILE_NO"] == null ? "" : json["MOBILE_NO"],
        RGN_NM: json["RGN_NM"] == null ? "" : json["RGN_NM"],
        TAX_AMT: json["TAX_AMT"] == null ? "" : json["TAX_AMT"],
      );

  Map<String, dynamic> toJson() => {
        "BILL_NO": BILL_NO == null ? "" : BILL_NO,
        "BILL_SRL": BILL_SRL == null ? "" : BILL_SRL,
        "BILL_AMT": BILL_AMT == null ? "" : BILL_AMT,
        "BILL_DATE": BILL_DATE == null ? "" : BILL_DATE,
        "BILL_TIME": BILL_TIME == null ? "" : BILL_TIME,
        "BILL_TYPE": BILL_TYPE == null ? "" : BILL_TYPE,
        "CSTMR_ADDRSS": CSTMR_ADDRSS == null ? "" : CSTMR_ADDRSS,
        "CSTMR_APRTMNT_NO": CSTMR_APRTMNT_NO == null ? "" : CSTMR_APRTMNT_NO,
        "CSTMR_BUILD_NO": CSTMR_BUILD_NO == null ? "" : CSTMR_BUILD_NO,
        "CSTMR_FLOOR_NO": CSTMR_FLOOR_NO == null ? "" : CSTMR_FLOOR_NO,
        "CSTMR_NM": CSTMR_NM == null ? "" : CSTMR_NM,
        "DLVRY_STATUS_FLG": DLVRY_STATUS_FLG == null ? "" : DLVRY_STATUS_FLG,
        "LATITUDE": LATITUDE == null ? "" : LATITUDE,
        "LONGITUDE": LONGITUDE == null ? "" : LONGITUDE,
        "MOBILE_NO": MOBILE_NO == null ? "" : MOBILE_NO,
        "RGN_NM": RGN_NM == null ? "" : RGN_NM,
        "TAX_AMT": TAX_AMT == null ? "" : TAX_AMT,
      };
}

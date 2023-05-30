import 'package:onyx_delivery_service/models/resault.dart';

class DeliveryBillsDetails extends Object {
  Data? data;
  Result? result;
  DeliveryBillsDetails({this.data, this.result});

  factory DeliveryBillsDetails.fromJson(Map<String, dynamic> parsedJson) {
    Data data = Data();
    Result result = Result();
    return DeliveryBillsDetails(
        data: parsedJson['Data'] != null
            ? Data.fromJson(parsedJson['Data'])
            : data,
        result: parsedJson['Result'] != null
            ? Result.fromJson(parsedJson['Result'])
            : result);
  }
}

class Data extends Object {
  List<DeliveryBillItems>? deliveryBillItems;

  Data({this.deliveryBillItems});

  factory Data.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['DeliveryBillItems'] as List;
    List<DeliveryBillItems> dev =
        list.map((i) => DeliveryBillItems.fromJson(i)).toList();

    return Data(deliveryBillItems: dev);
  }
}

class DeliveryBillItems {
  DeliveryBillItems({
    this.VAT_PRCNT,
    this.VAT_AMT,
    this.BILL_NO,
    this.BILL_SRL,
    this.P_SIZE,
    this.I_QTY,
    this.I_PRICE_VAT,
    this.I_PRICE,
    this.I_NM,
    this.I_CODE,
    this.ITM_UNT,
    this.MOBILE_NO,
  });

  String? BILL_NO;
  String? BILL_SRL;
  String? ITM_UNT;
  String? I_CODE;
  String? I_NM;
  String? I_PRICE;
  String? I_PRICE_VAT;
  String? I_QTY;
  String? MOBILE_NO;
  String? P_SIZE;
  String? VAT_AMT;
  String? VAT_PRCNT;

  factory DeliveryBillItems.fromJson(Map<String, dynamic> json) =>
      DeliveryBillItems(
        BILL_NO: json["BILL_NO"] == null ? "" : json["BILL_NO"],
        BILL_SRL: json["BILL_SRL"] == null ? "" : json["BILL_SRL"],
        I_CODE: json["I_CODE"] == null ? "" : json["I_CODE"],
        ITM_UNT: json["ITM_UNT"] == null ? "" : json["ITM_UNT"],
        I_NM: json["I_NM"] == null ? "" : json["I_NM"],
        I_PRICE: json["I_PRICE"] == null ? "" : json["I_PRICE"],
        I_PRICE_VAT: json["I_PRICE_VAT"] == null ? "" : json["I_PRICE_VAT"],
        I_QTY: json["I_QTY"] == null ? "" : json["I_QTY"],
        P_SIZE: json["P_SIZE"] == null ? "" : json["P_SIZE"],
        VAT_AMT: json["VAT_AMT"] == null ? "" : json["VAT_AMT"],
        VAT_PRCNT: json["VAT_PRCNT"] == null ? "" : json["VAT_PRCNT"],
        MOBILE_NO: json["MOBILE_NO"] == null ? "" : json["MOBILE_NO"],
      );

  Map<String, dynamic> toJson() => {
        "BILL_NO": BILL_NO == null ? "" : BILL_NO,
        "BILL_SRL": BILL_SRL == null ? "" : BILL_SRL,
        "I_CODE": I_CODE == null ? "" : I_CODE,
        "ITM_UNT": ITM_UNT == null ? "" : ITM_UNT,
        "I_NM": I_NM == null ? "" : I_NM,
        "I_PRICE": I_PRICE == null ? "" : I_PRICE,
        "I_PRICE_VAT": I_PRICE_VAT == null ? "" : I_PRICE_VAT,
        "I_QTY": I_QTY == null ? "" : I_QTY,
        "P_SIZE": P_SIZE == null ? "" : P_SIZE,
        "VAT_AMT": VAT_AMT == null ? "" : VAT_AMT,
        "VAT_PRCNT": VAT_PRCNT == null ? "" : VAT_PRCNT,
        "MOBILE_NO": MOBILE_NO == null ? "" : MOBILE_NO,
      };
}

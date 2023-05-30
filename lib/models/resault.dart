class Result {
  String? ErrMsg;
  int? ErrNo;

  Result({this.ErrMsg, this.ErrNo});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
        ErrMsg: json['ErrMsg'] != null ? json['ErrMsg'] : "",
        ErrNo: json['ErrNo'] != null ? json['ErrNo'] : null);
  }
}

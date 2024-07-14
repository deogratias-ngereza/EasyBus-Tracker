class BusDropPoint {
  double? latitude;
  double? longitude;
  String? pointCode;
  String? pointName;

  BusDropPoint({this.latitude, this.longitude, this.pointCode, this.pointName});

  BusDropPoint.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    pointCode = json['point_code'];
    pointName = json['point_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['point_code'] = this.pointCode;
    data['point_name'] = this.pointName;
    return data;
  }

  static List<BusDropPoint> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => BusDropPoint.fromJson(json)).toList();
  }
  static List<Map<String, dynamic>> toJsonList(List<BusDropPoint> dataList) {
    return dataList.map((dt) => dt.toJson()).toList();
  }
}

class Bus {
  String? id;
  String? color;
  String? currentRouteCode;
  double? latitude;
  double? longitude;
  String? gpsImei;
  String? plateNo;

  Bus(
      {this.id,
        this.color,
        this.currentRouteCode,
        this.latitude,
        this.longitude,
        this.gpsImei,
        this.plateNo});

  Bus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    color = json['color'];
    currentRouteCode = json['current_route_code'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    gpsImei = json['gps_imei'];
    plateNo = json['plate_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['color'] = this.color;
    data['current_route_code'] = this.currentRouteCode;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['gps_imei'] = this.gpsImei;
    data['plate_no'] = this.plateNo;
    return data;
  }
  static List<Bus> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Bus.fromJson(json)).toList();
  }
  static List<Map<String, dynamic>> toJsonList(List<Bus> dataList) {
    return dataList.map((dt) => dt.toJson()).toList();
  }



}

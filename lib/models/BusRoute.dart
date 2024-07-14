class BusRoute {
  dynamic? routeCode;
  List<String>? routeFlow;
  dynamic? routeName;

  BusRoute({this.routeCode, this.routeFlow, this.routeName});

  BusRoute.fromJson(Map<String, dynamic> json) {
    routeCode = json['route_code'];
    routeFlow = json['route_flow'].cast<String>();
    routeName = json['route_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['route_code'] = this.routeCode;
    data['route_flow'] = this.routeFlow;
    data['route_name'] = this.routeName;
    return data;
  }


  static List<BusRoute> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => BusRoute.fromJson(json)).toList();
  }
  static List<Map<String, dynamic>> toJsonList(List<BusRoute> dataList) {
    return dataList.map((dt) => dt.toJson()).toList();
  }
}
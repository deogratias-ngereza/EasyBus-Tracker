class User {
  String? accountNo;
  String? password;
  String? phone;
  String? region;
  String? role;
  String? username;

  User(
      {this.accountNo,
        this.password,
        this.phone,
        this.region,
        this.role,
        this.username});

  User.fromJson(Map<String, dynamic> json) {
    accountNo = json['account_no'];
    password = json['password'];
    phone = json['phone'];
    region = json['region'];
    role = json['role'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_no'] = this.accountNo;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['region'] = this.region;
    data['role'] = this.role;
    data['username'] = this.username;
    return data;
  }

  static List<User> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => User.fromJson(json)).toList();
  }
  static List<Map<String, dynamic>> toJsonList(List<User> dataList) {
    return dataList.map((dt) => dt.toJson()).toList();
  }


}

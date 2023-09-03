class LogOut {
  bool? status;
  String? message;
  Data? data;

  LogOut({
    this.status,
    this.message,
    this.data,
  });

  factory LogOut.fromJson(Map<String, dynamic> json) => LogOut(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  int? id;
  String? token;

  Data({
    this.id,
    this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "token": token,
  };
}
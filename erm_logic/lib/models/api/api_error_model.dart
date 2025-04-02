// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ApiErrorModel welcomeFromJson(String str) => ApiErrorModel.fromJson(json.decode(str));

String welcomeToJson(ApiErrorModel data) => json.encode(data.toJson());

class ApiErrorModel {
    DateTime timestamp;
    int status;
    String error;
    String path;

    ApiErrorModel({
        required this.timestamp,
        required this.status,
        required this.error,
        required this.path,
    });

    factory ApiErrorModel.fromJson(Map<String, dynamic> json) => ApiErrorModel(
        timestamp: DateTime.parse(json["timestamp"]),
        status: json["status"],
        error: json["error"],
        path: json["path"],
    );

    Map<String, dynamic> toJson() => {
        "timestamp": timestamp.toIso8601String(),
        "status": status,
        "error": error,
        "path": path,
    };
}

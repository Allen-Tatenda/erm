// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ApiException welcomeFromJson(String str) => ApiException.fromJson(json.decode(str));

String welcomeToJson(ApiException data) => json.encode(data.toJson());

class ApiException {
    final DateTime? timestamp;
    final int? status;
    final String error;
    final String? path;

    ApiException({
        this.timestamp,
        this.status,
        required this.error,
        this.path,
    });

    factory ApiException.fromJson(Map<String, dynamic> json) => ApiException(
        timestamp: json["timestamp"] == null ? null : DateTime.parse(json["timestamp"]),
        status: json["status"],
        error: json["error"],
        path: json["path"],
    );

    Map<String, dynamic> toJson() => {
        "timestamp": timestamp?.toIso8601String(),
        "status": status,
        "error": error,
        "path": path,
    };
}

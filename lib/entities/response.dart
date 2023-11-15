// To parse this JSON data, do
//
//     final response = responseFromJson(jsonString);

import 'dart:convert';

ResponseEntitie responseFromJson(String str) => ResponseEntitie.fromJson(json.decode(str));

String responseToJson(ResponseEntitie data) => json.encode(data.toJson());

class ResponseEntitie {
  List<Result> result;

  ResponseEntitie({
    required this.result,
  });

  factory ResponseEntitie.fromJson(Map<String, dynamic> json) => ResponseEntitie(
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class Result {
  String label;
  double score;

  Result({
    required this.label,
    required this.score,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    label: json["label"],
    score: json["score"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "label": label,
    "score": score,
  };
}

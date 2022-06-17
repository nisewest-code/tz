
import 'package:json_annotation/json_annotation.dart';
part 'data.g.dart';

@JsonSerializable()
class Mx{
  String exchange;
  int priority;

  Mx({required this.exchange, required this.priority});

  factory Mx.fromJson(Map<String, dynamic> json) => _$MxFromJson(json);
  Map<String, dynamic> toJson() => _$MxToJson(this);
}

@JsonSerializable()
class Domain {
  String domain;
  List<String>? A;
  List<String>? NS;
  List<String>? TXT;
  List<Mx>? MX;
  List<String>? CNAME;

  Domain({required this.domain, this.A, this.NS,
    this.TXT, this.MX, this.CNAME});

  factory Domain.fromJson(Map<String, dynamic> json) => _$DomainFromJson(json);
  Map<String, dynamic> toJson() => _$DomainToJson(this);
}

@JsonSerializable()
class ResponseData{
  List<Domain>? domains;
  int? total;
  String? time;

  ResponseData({this.domains, this.total, this.time});
  factory ResponseData.fromJson(Map<String, dynamic> json) => _$ResponseDataFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseDataToJson(this);
}
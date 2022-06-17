// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mx _$MxFromJson(Map<String, dynamic> json) => Mx(
      exchange: json['exchange'] as String,
      priority: json['priority'] as int,
    );

Map<String, dynamic> _$MxToJson(Mx instance) => <String, dynamic>{
      'exchange': instance.exchange,
      'priority': instance.priority,
    };

Domain _$DomainFromJson(Map<String, dynamic> json) => Domain(
      domain: json['domain'] as String,
      A: (json['A'] as List<dynamic>?)?.map((e) => e as String).toList(),
      NS: (json['NS'] as List<dynamic>?)?.map((e) => e as String).toList(),
      TXT: (json['TXT'] as List<dynamic>?)?.map((e) => e as String).toList(),
      MX: (json['MX'] as List<dynamic>?)
          ?.map((e) => Mx.fromJson(e as Map<String, dynamic>))
          .toList(),
      CNAME:
          (json['CNAME'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$DomainToJson(Domain instance) => <String, dynamic>{
      'domain': instance.domain,
      'A': instance.A,
      'NS': instance.NS,
      'TXT': instance.TXT,
      'MX': instance.MX,
      'CNAME': instance.CNAME,
    };

ResponseData _$ResponseDataFromJson(Map<String, dynamic> json) => ResponseData(
      domains: (json['domains'] as List<dynamic>?)
          ?.map((e) => Domain.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$ResponseDataToJson(ResponseData instance) =>
    <String, dynamic>{
      'domains': instance.domains,
      'total': instance.total,
      'time': instance.time,
    };

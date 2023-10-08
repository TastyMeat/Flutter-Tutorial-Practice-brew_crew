// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brew.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BrewImpl _$$BrewImplFromJson(Map<String, dynamic> json) => _$BrewImpl(
      name: json['name'] as String? ?? 'New Crew',
      strength: json['strength'] as int? ?? 100,
      sugarCount: json['sugarCount'] as String? ?? '0',
    );

Map<String, dynamic> _$$BrewImplToJson(_$BrewImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'strength': instance.strength,
      'sugarCount': instance.sugarCount,
    };

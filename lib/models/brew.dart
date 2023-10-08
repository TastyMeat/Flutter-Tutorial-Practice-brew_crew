import 'package:freezed_annotation/freezed_annotation.dart';

part 'brew.freezed.dart';
part 'brew.g.dart';

@freezed
class Brew with _$Brew {
  factory Brew({
    @Default('New Crew') String name,
    @Default(100) int strength,
    @Default('0') String sugarCount,
  }) = _Brew;

  factory Brew.fromJson(Map<String, dynamic> json) => _$BrewFromJson(json);
}

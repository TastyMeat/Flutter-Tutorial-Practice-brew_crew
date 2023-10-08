// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'brew.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Brew _$BrewFromJson(Map<String, dynamic> json) {
  return _Brew.fromJson(json);
}

/// @nodoc
mixin _$Brew {
  String get name => throw _privateConstructorUsedError;
  int get strength => throw _privateConstructorUsedError;
  String get sugarCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BrewCopyWith<Brew> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrewCopyWith<$Res> {
  factory $BrewCopyWith(Brew value, $Res Function(Brew) then) =
      _$BrewCopyWithImpl<$Res, Brew>;
  @useResult
  $Res call({String name, int strength, String sugarCount});
}

/// @nodoc
class _$BrewCopyWithImpl<$Res, $Val extends Brew>
    implements $BrewCopyWith<$Res> {
  _$BrewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? strength = null,
    Object? sugarCount = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      strength: null == strength
          ? _value.strength
          : strength // ignore: cast_nullable_to_non_nullable
              as int,
      sugarCount: null == sugarCount
          ? _value.sugarCount
          : sugarCount // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BrewImplCopyWith<$Res> implements $BrewCopyWith<$Res> {
  factory _$$BrewImplCopyWith(
          _$BrewImpl value, $Res Function(_$BrewImpl) then) =
      __$$BrewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int strength, String sugarCount});
}

/// @nodoc
class __$$BrewImplCopyWithImpl<$Res>
    extends _$BrewCopyWithImpl<$Res, _$BrewImpl>
    implements _$$BrewImplCopyWith<$Res> {
  __$$BrewImplCopyWithImpl(_$BrewImpl _value, $Res Function(_$BrewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? strength = null,
    Object? sugarCount = null,
  }) {
    return _then(_$BrewImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      strength: null == strength
          ? _value.strength
          : strength // ignore: cast_nullable_to_non_nullable
              as int,
      sugarCount: null == sugarCount
          ? _value.sugarCount
          : sugarCount // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BrewImpl implements _Brew {
  _$BrewImpl(
      {this.name = 'New Crew', this.strength = 100, this.sugarCount = '0'});

  factory _$BrewImpl.fromJson(Map<String, dynamic> json) =>
      _$$BrewImplFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final int strength;
  @override
  @JsonKey()
  final String sugarCount;

  @override
  String toString() {
    return 'Brew(name: $name, strength: $strength, sugarCount: $sugarCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BrewImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.strength, strength) ||
                other.strength == strength) &&
            (identical(other.sugarCount, sugarCount) ||
                other.sugarCount == sugarCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, strength, sugarCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BrewImplCopyWith<_$BrewImpl> get copyWith =>
      __$$BrewImplCopyWithImpl<_$BrewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BrewImplToJson(
      this,
    );
  }
}

abstract class _Brew implements Brew {
  factory _Brew(
      {final String name,
      final int strength,
      final String sugarCount}) = _$BrewImpl;

  factory _Brew.fromJson(Map<String, dynamic> json) = _$BrewImpl.fromJson;

  @override
  String get name;
  @override
  int get strength;
  @override
  String get sugarCount;
  @override
  @JsonKey(ignore: true)
  _$$BrewImplCopyWith<_$BrewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

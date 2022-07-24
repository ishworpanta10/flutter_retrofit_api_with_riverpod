// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'configuration_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConfigurationModel _$ConfigurationModelFromJson(Map<String, dynamic> json) {
  return _ConfigurationModel.fromJson(json);
}

/// @nodoc
mixin _$ConfigurationModel {
  String get apiKey => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConfigurationModelCopyWith<ConfigurationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigurationModelCopyWith<$Res> {
  factory $ConfigurationModelCopyWith(
          ConfigurationModel value, $Res Function(ConfigurationModel) then) =
      _$ConfigurationModelCopyWithImpl<$Res>;
  $Res call({String apiKey});
}

/// @nodoc
class _$ConfigurationModelCopyWithImpl<$Res>
    implements $ConfigurationModelCopyWith<$Res> {
  _$ConfigurationModelCopyWithImpl(this._value, this._then);

  final ConfigurationModel _value;
  // ignore: unused_field
  final $Res Function(ConfigurationModel) _then;

  @override
  $Res call({
    Object? apiKey = freezed,
  }) {
    return _then(_value.copyWith(
      apiKey: apiKey == freezed
          ? _value.apiKey
          : apiKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ConfigurationModelCopyWith<$Res>
    implements $ConfigurationModelCopyWith<$Res> {
  factory _$$_ConfigurationModelCopyWith(_$_ConfigurationModel value,
          $Res Function(_$_ConfigurationModel) then) =
      __$$_ConfigurationModelCopyWithImpl<$Res>;
  @override
  $Res call({String apiKey});
}

/// @nodoc
class __$$_ConfigurationModelCopyWithImpl<$Res>
    extends _$ConfigurationModelCopyWithImpl<$Res>
    implements _$$_ConfigurationModelCopyWith<$Res> {
  __$$_ConfigurationModelCopyWithImpl(
      _$_ConfigurationModel _value, $Res Function(_$_ConfigurationModel) _then)
      : super(_value, (v) => _then(v as _$_ConfigurationModel));

  @override
  _$_ConfigurationModel get _value => super._value as _$_ConfigurationModel;

  @override
  $Res call({
    Object? apiKey = freezed,
  }) {
    return _then(_$_ConfigurationModel(
      apiKey: apiKey == freezed
          ? _value.apiKey
          : apiKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_ConfigurationModel implements _ConfigurationModel {
  const _$_ConfigurationModel({required this.apiKey});

  factory _$_ConfigurationModel.fromJson(Map<String, dynamic> json) =>
      _$$_ConfigurationModelFromJson(json);

  @override
  final String apiKey;

  @override
  String toString() {
    return 'ConfigurationModel(apiKey: $apiKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConfigurationModel &&
            const DeepCollectionEquality().equals(other.apiKey, apiKey));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(apiKey));

  @JsonKey(ignore: true)
  @override
  _$$_ConfigurationModelCopyWith<_$_ConfigurationModel> get copyWith =>
      __$$_ConfigurationModelCopyWithImpl<_$_ConfigurationModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConfigurationModelToJson(
      this,
    );
  }
}

abstract class _ConfigurationModel implements ConfigurationModel {
  const factory _ConfigurationModel({required final String apiKey}) =
      _$_ConfigurationModel;

  factory _ConfigurationModel.fromJson(Map<String, dynamic> json) =
      _$_ConfigurationModel.fromJson;

  @override
  String get apiKey;
  @override
  @JsonKey(ignore: true)
  _$$_ConfigurationModelCopyWith<_$_ConfigurationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

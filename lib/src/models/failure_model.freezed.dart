// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'failure_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FailureModel {
  String? get message => throw _privateConstructorUsedError;
  String? get statusMessage => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FailureModelCopyWith<FailureModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureModelCopyWith<$Res> {
  factory $FailureModelCopyWith(
          FailureModel value, $Res Function(FailureModel) then) =
      _$FailureModelCopyWithImpl<$Res>;
  $Res call({String? message, String? statusMessage, int? code});
}

/// @nodoc
class _$FailureModelCopyWithImpl<$Res> implements $FailureModelCopyWith<$Res> {
  _$FailureModelCopyWithImpl(this._value, this._then);

  final FailureModel _value;
  // ignore: unused_field
  final $Res Function(FailureModel) _then;

  @override
  $Res call({
    Object? message = freezed,
    Object? statusMessage = freezed,
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      statusMessage: statusMessage == freezed
          ? _value.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_FailureModelCopyWith<$Res>
    implements $FailureModelCopyWith<$Res> {
  factory _$$_FailureModelCopyWith(
          _$_FailureModel value, $Res Function(_$_FailureModel) then) =
      __$$_FailureModelCopyWithImpl<$Res>;
  @override
  $Res call({String? message, String? statusMessage, int? code});
}

/// @nodoc
class __$$_FailureModelCopyWithImpl<$Res>
    extends _$FailureModelCopyWithImpl<$Res>
    implements _$$_FailureModelCopyWith<$Res> {
  __$$_FailureModelCopyWithImpl(
      _$_FailureModel _value, $Res Function(_$_FailureModel) _then)
      : super(_value, (v) => _then(v as _$_FailureModel));

  @override
  _$_FailureModel get _value => super._value as _$_FailureModel;

  @override
  $Res call({
    Object? message = freezed,
    Object? statusMessage = freezed,
    Object? code = freezed,
  }) {
    return _then(_$_FailureModel(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      statusMessage: statusMessage == freezed
          ? _value.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_FailureModel implements _FailureModel {
  const _$_FailureModel(
      {this.message = 'Something went wrong',
      this.statusMessage = 'Error',
      this.code});

  @override
  @JsonKey()
  final String? message;
  @override
  @JsonKey()
  final String? statusMessage;
  @override
  final int? code;

  @override
  String toString() {
    return 'FailureModel(message: $message, statusMessage: $statusMessage, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FailureModel &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality()
                .equals(other.statusMessage, statusMessage) &&
            const DeepCollectionEquality().equals(other.code, code));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(statusMessage),
      const DeepCollectionEquality().hash(code));

  @JsonKey(ignore: true)
  @override
  _$$_FailureModelCopyWith<_$_FailureModel> get copyWith =>
      __$$_FailureModelCopyWithImpl<_$_FailureModel>(this, _$identity);
}

abstract class _FailureModel implements FailureModel {
  const factory _FailureModel(
      {final String? message,
      final String? statusMessage,
      final int? code}) = _$_FailureModel;

  @override
  String? get message;
  @override
  String? get statusMessage;
  @override
  int? get code;
  @override
  @JsonKey(ignore: true)
  _$$_FailureModelCopyWith<_$_FailureModel> get copyWith =>
      throw _privateConstructorUsedError;
}

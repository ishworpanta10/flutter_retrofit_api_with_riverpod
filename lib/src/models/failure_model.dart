import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure_model.freezed.dart';

@freezed
class FailureModel with _$FailureModel {
  @JsonSerializable(explicitToJson: true)
  const factory FailureModel({@Default('Something went wrong') String message, int? code}) = _FailureModel;
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'configuration_model.freezed.dart';
part 'configuration_model.g.dart';

@freezed
class ConfigurationModel with _$ConfigurationModel {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory ConfigurationModel({required String apiKey}) = _ConfigurationModel;

  factory ConfigurationModel.fromJson(Map<String, dynamic> json) => _$ConfigurationModelFromJson(json);
}

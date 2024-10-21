import 'package:freezed_annotation/freezed_annotation.dart';
part 'form_step_model.freezed.dart';
part 'form_step_model.g.dart';

@freezed
class FormStepModel with _$FormStepModel {
  factory FormStepModel({
    required String title,
    required String label,
    @Default(false) bool isCompleted,
    @Default({}) Map<String, dynamic> formData,
  }) = _FormStepModel;

  factory FormStepModel.fromJson(Map<String, dynamic> json) =>
      _$FormStepModelFromJson(json);
}

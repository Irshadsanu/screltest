// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_step_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FormStepModelImpl _$$FormStepModelImplFromJson(Map<String, dynamic> json) =>
    _$FormStepModelImpl(
      title: json['title'] as String,
      label: json['label'] as String,
      isCompleted: json['isCompleted'] as bool? ?? false,
      formData: json['formData'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$FormStepModelImplToJson(_$FormStepModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'label': instance.label,
      'isCompleted': instance.isCompleted,
      'formData': instance.formData,
    };

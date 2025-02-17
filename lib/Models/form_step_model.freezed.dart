// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_step_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FormStepModel _$FormStepModelFromJson(Map<String, dynamic> json) {
  return _FormStepModel.fromJson(json);
}

/// @nodoc
mixin _$FormStepModel {
  String get title => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  Map<String, dynamic> get formData => throw _privateConstructorUsedError;

  /// Serializes this FormStepModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FormStepModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FormStepModelCopyWith<FormStepModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormStepModelCopyWith<$Res> {
  factory $FormStepModelCopyWith(
          FormStepModel value, $Res Function(FormStepModel) then) =
      _$FormStepModelCopyWithImpl<$Res, FormStepModel>;
  @useResult
  $Res call(
      {String title,
      String label,
      bool isCompleted,
      Map<String, dynamic> formData});
}

/// @nodoc
class _$FormStepModelCopyWithImpl<$Res, $Val extends FormStepModel>
    implements $FormStepModelCopyWith<$Res> {
  _$FormStepModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FormStepModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? label = null,
    Object? isCompleted = null,
    Object? formData = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      formData: null == formData
          ? _value.formData
          : formData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FormStepModelImplCopyWith<$Res>
    implements $FormStepModelCopyWith<$Res> {
  factory _$$FormStepModelImplCopyWith(
          _$FormStepModelImpl value, $Res Function(_$FormStepModelImpl) then) =
      __$$FormStepModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String label,
      bool isCompleted,
      Map<String, dynamic> formData});
}

/// @nodoc
class __$$FormStepModelImplCopyWithImpl<$Res>
    extends _$FormStepModelCopyWithImpl<$Res, _$FormStepModelImpl>
    implements _$$FormStepModelImplCopyWith<$Res> {
  __$$FormStepModelImplCopyWithImpl(
      _$FormStepModelImpl _value, $Res Function(_$FormStepModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FormStepModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? label = null,
    Object? isCompleted = null,
    Object? formData = null,
  }) {
    return _then(_$FormStepModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      formData: null == formData
          ? _value._formData
          : formData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FormStepModelImpl implements _FormStepModel {
  _$FormStepModelImpl(
      {required this.title,
      required this.label,
      this.isCompleted = false,
      final Map<String, dynamic> formData = const {}})
      : _formData = formData;

  factory _$FormStepModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FormStepModelImplFromJson(json);

  @override
  final String title;
  @override
  final String label;
  @override
  @JsonKey()
  final bool isCompleted;
  final Map<String, dynamic> _formData;
  @override
  @JsonKey()
  Map<String, dynamic> get formData {
    if (_formData is EqualUnmodifiableMapView) return _formData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_formData);
  }

  @override
  String toString() {
    return 'FormStepModel(title: $title, label: $label, isCompleted: $isCompleted, formData: $formData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormStepModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            const DeepCollectionEquality().equals(other._formData, _formData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, label, isCompleted,
      const DeepCollectionEquality().hash(_formData));

  /// Create a copy of FormStepModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormStepModelImplCopyWith<_$FormStepModelImpl> get copyWith =>
      __$$FormStepModelImplCopyWithImpl<_$FormStepModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FormStepModelImplToJson(
      this,
    );
  }
}

abstract class _FormStepModel implements FormStepModel {
  factory _FormStepModel(
      {required final String title,
      required final String label,
      final bool isCompleted,
      final Map<String, dynamic> formData}) = _$FormStepModelImpl;

  factory _FormStepModel.fromJson(Map<String, dynamic> json) =
      _$FormStepModelImpl.fromJson;

  @override
  String get title;
  @override
  String get label;
  @override
  bool get isCompleted;
  @override
  Map<String, dynamic> get formData;

  /// Create a copy of FormStepModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormStepModelImplCopyWith<_$FormStepModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

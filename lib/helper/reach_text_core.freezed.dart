// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reach_text_core.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CompanyRichTextModel {
  List<HighlightedTextModel> get highlightedTextModels =>
      throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  int? get maxLines => throw _privateConstructorUsedError;
  TextAlign get textAlign => throw _privateConstructorUsedError;
  TextStyle get accentTextStyle => throw _privateConstructorUsedError;
  TextStyle get normalTextStyle => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CompanyRichTextModelCopyWith<CompanyRichTextModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyRichTextModelCopyWith<$Res> {
  factory $CompanyRichTextModelCopyWith(CompanyRichTextModel value,
          $Res Function(CompanyRichTextModel) then) =
      _$CompanyRichTextModelCopyWithImpl<$Res, CompanyRichTextModel>;
  @useResult
  $Res call(
      {List<HighlightedTextModel> highlightedTextModels,
      String text,
      int? maxLines,
      TextAlign textAlign,
      TextStyle accentTextStyle,
      TextStyle normalTextStyle,
      String? id});
}

/// @nodoc
class _$CompanyRichTextModelCopyWithImpl<$Res,
        $Val extends CompanyRichTextModel>
    implements $CompanyRichTextModelCopyWith<$Res> {
  _$CompanyRichTextModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? highlightedTextModels = null,
    Object? text = null,
    Object? maxLines = freezed,
    Object? textAlign = null,
    Object? accentTextStyle = null,
    Object? normalTextStyle = null,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      highlightedTextModels: null == highlightedTextModels
          ? _value.highlightedTextModels
          : highlightedTextModels // ignore: cast_nullable_to_non_nullable
              as List<HighlightedTextModel>,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      maxLines: freezed == maxLines
          ? _value.maxLines
          : maxLines // ignore: cast_nullable_to_non_nullable
              as int?,
      textAlign: null == textAlign
          ? _value.textAlign
          : textAlign // ignore: cast_nullable_to_non_nullable
              as TextAlign,
      accentTextStyle: null == accentTextStyle
          ? _value.accentTextStyle
          : accentTextStyle // ignore: cast_nullable_to_non_nullable
              as TextStyle,
      normalTextStyle: null == normalTextStyle
          ? _value.normalTextStyle
          : normalTextStyle // ignore: cast_nullable_to_non_nullable
              as TextStyle,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CompanyRichTextModelCopyWith<$Res>
    implements $CompanyRichTextModelCopyWith<$Res> {
  factory _$$_CompanyRichTextModelCopyWith(_$_CompanyRichTextModel value,
          $Res Function(_$_CompanyRichTextModel) then) =
      __$$_CompanyRichTextModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<HighlightedTextModel> highlightedTextModels,
      String text,
      int? maxLines,
      TextAlign textAlign,
      TextStyle accentTextStyle,
      TextStyle normalTextStyle,
      String? id});
}

/// @nodoc
class __$$_CompanyRichTextModelCopyWithImpl<$Res>
    extends _$CompanyRichTextModelCopyWithImpl<$Res, _$_CompanyRichTextModel>
    implements _$$_CompanyRichTextModelCopyWith<$Res> {
  __$$_CompanyRichTextModelCopyWithImpl(_$_CompanyRichTextModel _value,
      $Res Function(_$_CompanyRichTextModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? highlightedTextModels = null,
    Object? text = null,
    Object? maxLines = freezed,
    Object? textAlign = null,
    Object? accentTextStyle = null,
    Object? normalTextStyle = null,
    Object? id = freezed,
  }) {
    return _then(_$_CompanyRichTextModel(
      highlightedTextModels: null == highlightedTextModels
          ? _value._highlightedTextModels
          : highlightedTextModels // ignore: cast_nullable_to_non_nullable
              as List<HighlightedTextModel>,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      maxLines: freezed == maxLines
          ? _value.maxLines
          : maxLines // ignore: cast_nullable_to_non_nullable
              as int?,
      textAlign: null == textAlign
          ? _value.textAlign
          : textAlign // ignore: cast_nullable_to_non_nullable
              as TextAlign,
      accentTextStyle: null == accentTextStyle
          ? _value.accentTextStyle
          : accentTextStyle // ignore: cast_nullable_to_non_nullable
              as TextStyle,
      normalTextStyle: null == normalTextStyle
          ? _value.normalTextStyle
          : normalTextStyle // ignore: cast_nullable_to_non_nullable
              as TextStyle,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_CompanyRichTextModel implements _CompanyRichTextModel {
  const _$_CompanyRichTextModel(
      {required final List<HighlightedTextModel> highlightedTextModels,
      required this.text,
      this.maxLines = 3,
      this.textAlign = TextAlign.center,
      required this.accentTextStyle,
      required this.normalTextStyle,
      this.id})
      : _highlightedTextModels = highlightedTextModels;

  final List<HighlightedTextModel> _highlightedTextModels;
  @override
  List<HighlightedTextModel> get highlightedTextModels {
    if (_highlightedTextModels is EqualUnmodifiableListView)
      return _highlightedTextModels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_highlightedTextModels);
  }

  @override
  final String text;
  @override
  @JsonKey()
  final int? maxLines;
  @override
  @JsonKey()
  final TextAlign textAlign;
  @override
  final TextStyle accentTextStyle;
  @override
  final TextStyle normalTextStyle;
  @override
  final String? id;

  @override
  String toString() {
    return 'CompanyRichTextModel(highlightedTextModels: $highlightedTextModels, text: $text, maxLines: $maxLines, textAlign: $textAlign, accentTextStyle: $accentTextStyle, normalTextStyle: $normalTextStyle, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CompanyRichTextModel &&
            const DeepCollectionEquality()
                .equals(other._highlightedTextModels, _highlightedTextModels) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.maxLines, maxLines) ||
                other.maxLines == maxLines) &&
            (identical(other.textAlign, textAlign) ||
                other.textAlign == textAlign) &&
            (identical(other.accentTextStyle, accentTextStyle) ||
                other.accentTextStyle == accentTextStyle) &&
            (identical(other.normalTextStyle, normalTextStyle) ||
                other.normalTextStyle == normalTextStyle) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_highlightedTextModels),
      text,
      maxLines,
      textAlign,
      accentTextStyle,
      normalTextStyle,
      id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CompanyRichTextModelCopyWith<_$_CompanyRichTextModel> get copyWith =>
      __$$_CompanyRichTextModelCopyWithImpl<_$_CompanyRichTextModel>(
          this, _$identity);
}

abstract class _CompanyRichTextModel implements CompanyRichTextModel {
  const factory _CompanyRichTextModel(
      {required final List<HighlightedTextModel> highlightedTextModels,
      required final String text,
      final int? maxLines,
      final TextAlign textAlign,
      required final TextStyle accentTextStyle,
      required final TextStyle normalTextStyle,
      final String? id}) = _$_CompanyRichTextModel;

  @override
  List<HighlightedTextModel> get highlightedTextModels;
  @override
  String get text;
  @override
  int? get maxLines;
  @override
  TextAlign get textAlign;
  @override
  TextStyle get accentTextStyle;
  @override
  TextStyle get normalTextStyle;
  @override
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$_CompanyRichTextModelCopyWith<_$_CompanyRichTextModel> get copyWith =>
      throw _privateConstructorUsedError;
}

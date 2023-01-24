import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reach_text_core.freezed.dart';

class HighlightedTextModel {
  final String text;
  final VoidCallback? onTap;

  HighlightedTextModel(
    this.text, {
    this.onTap,
  });
}

@freezed
class CompanyRichTextModel with _$CompanyRichTextModel {
  const factory CompanyRichTextModel({
    required List<HighlightedTextModel> highlightedTextModels,
    required String text,
    @Default(3) int? maxLines,
    @Default(TextAlign.center) TextAlign textAlign,
    required TextStyle accentTextStyle,
    required TextStyle normalTextStyle,
    String? id,
  }) = _CompanyRichTextModel;
}

class CompanyRichText extends StatelessWidget {
  final CompanyRichTextModel model;
  const CompanyRichText(this.model);

  @override
  Widget build(BuildContext context) {
    final listOfSpans = getTextSpan(
      model.highlightedTextModels,
      model.text,
      model.accentTextStyle,
      model.normalTextStyle,
    );

    return RichText(
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.left,
      text: TextSpan(
        text: listOfSpans[0].text,
        style: listOfSpans[0].style,
        children: listOfSpans.skip(1).toList(),
      ),
    );
  }
}

List<TextSpan> getTextSpan(
  List<HighlightedTextModel> highlightedTextModels,
  String text,
  TextStyle accentStyle,
  TextStyle normalStyle,
) {
  final highlightedTexts = highlightedTextModels.map((e) => e.text).toList();

  String copyText = text;
  final List<TextSpan> ourlList = [];
  int currentIndex = 0;
  for (int i = 0; i < highlightedTexts.length; i++) {
    if (copyText.contains(highlightedTexts[i])) {
      final previousNormalText = copyText.substring(
          currentIndex, copyText.indexOf(highlightedTexts[i]));
      if (previousNormalText.isNotEmpty) {
        ourlList.add(TextSpan(
          text: previousNormalText,
          style: normalStyle,
        ));
      }
      ourlList.add(TextSpan(
        text: copyText.substring(copyText.indexOf(highlightedTexts[i]),
            copyText.indexOf(highlightedTexts[i]) + highlightedTexts[i].length),
        style: accentStyle,
        recognizer: TapGestureRecognizer()
          ..onTap = highlightedTextModels[i].onTap,
      ));

      copyText = copyText.replaceRange(
          currentIndex,
          copyText.indexOf(highlightedTexts[i]) + highlightedTexts[i].length,
          '');
    }
  }

  if (copyText.isNotEmpty) {
    ourlList.add(TextSpan(
      text: copyText,
      style: normalStyle,
    ));
  }

  return ourlList;
}

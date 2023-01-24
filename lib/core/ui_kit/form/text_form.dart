import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanban/core/ui_kit/text/text_withgooglefonts_widet.dart';
import 'package:kanban/helper/color_helper.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TextFormFieldWidget extends StatelessWidget {
  Iterable<String>? autofillHints;
  TextEditingController? controller;
  FocusNode? focusNode;
  bool obscureText;
  Widget? suffixIcon;
  String? title;
  TextInputType? textInputType;
  String? hintText;
  Color backColor;
  TextInputFormatter? maskTextInputFormatter;
  String? Function(String? val)? validator;
  int? maxLines;

  void Function()? onEditingComplete;

  TextFormFieldWidget({
    this.title,
    this.obscureText = false,
    this.autofillHints,
    this.controller,
    this.focusNode,
    this.suffixIcon = const SizedBox(),
    this.textInputType,
    this.hintText,
    this.backColor = ColorHelper.greyTextColor,
    this.onEditingComplete,
    this.maskTextInputFormatter,
    this.validator,
    this.maxLines,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          TextStyleGenerator(
            text: title,
            fontSize: 12.sp,
            color: ColorHelper.greyTextColor,
          ),
          12.h.verticalSpace,
        ],
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(
                5.sp,
              ),
            ),
            border: Border.all(
              color: ColorHelper.greyTextColor,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextFormField(
            validator: validator,
            inputFormatters: [
              maskTextInputFormatter ?? MaskTextInputFormatter(),
            ],
            onEditingComplete: onEditingComplete,
            keyboardType: textInputType,
            obscureText: obscureText,
            controller: controller,
            focusNode: focusNode,
            style: const TextStyle(
              color: ColorHelper.whiteColor,
              fontWeight: FontWeight.w700,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              suffixIcon: suffixIcon,
              hintText: hintText,
              hintStyle: TextStyle(
                color: ColorHelper.whiteColor,
                fontWeight: FontWeight.w700,
                fontSize: 12.sp,
              ),
              labelStyle: TextStyle(
                color: ColorHelper.whiteColor,
                fontWeight: FontWeight.w700,
                fontSize: 12.sp,
              ),
            ),
            textAlign: TextAlign.left,
            autofillHints: autofillHints,
            maxLines: maxLines,
            minLines: 1,
          ),
        ),
      ],
    );
  }
}

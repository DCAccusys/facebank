import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../config/constants/colors.dart';
import '../../config/constants/fonts_styles.dart';

class CustomInputField extends StatelessWidget {
  final String text;
  final String placeholder;
  final String? helperText;
  final int? maxLength;
  final Color? textColor;
  final Color? inputTextColor;
  final Color? placeholderColor;
  final Color? borderFocusedColor;
  final Color? borderColor;
  final TextEditingController? textController;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? formatters;
  final TextCapitalization? textCapitalization;

  const CustomInputField(
      {super.key,
      required this.text,
      required this.placeholder,
      this.textColor,
      this.maxLength,
      this.inputTextColor,
      this.placeholderColor,
      this.borderFocusedColor,
      this.borderColor,
      this.textController,
      this.textInputAction,
      this.textInputType,
      this.helperText,
      this.formatters,
      this.textCapitalization});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            this.text,
            style: CustomFontStyle.text500Normal14px(
                this.textColor ?? textDefaultColor,
                isBold: true),
          ),
          SizedBox(
            height: 8,
          ),
          TextField(
            controller: this.textController,
            textCapitalization:
                this.textCapitalization ?? TextCapitalization.none,
            maxLength: this.maxLength,
            inputFormatters:
                this.formatters != null ? [...this.formatters!] : null,
            textInputAction: this.textInputAction ?? TextInputAction.next,
            keyboardType: this.textInputType ?? TextInputType.text,
            style: CustomFontStyle.text500Normal16px(
                this.inputTextColor ?? textDefaultColor),
            decoration: InputDecoration(
              helperText: this.helperText,
              helperStyle: CustomFontStyle.text400Normal14px(
                textLighterColor,
                letterSpacing: true,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: this.borderColor ?? borderDefaultColor,
                  style: BorderStyle.solid,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: this.borderFocusedColor ?? cardPrimaryDefaultColor,
                  style: BorderStyle.solid,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              hintText: this.placeholder,
              hintStyle: CustomFontStyle.text400Normal16px(
                this.placeholderColor ?? textDisabledColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}

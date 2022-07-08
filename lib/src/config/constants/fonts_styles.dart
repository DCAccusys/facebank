import 'package:flutter/cupertino.dart';

class CustomFontStyle {
  static text400Normal12px(Color textColor,
          {bool? letterSpacing, bool? isBold}) =>
      TextStyle(
        fontSize: 12,
        fontWeight: isBold ?? false ? FontWeight.bold : FontWeight.w400,
        letterSpacing: letterSpacing ?? false ? 0.1 : null,
        color: textColor,
        fontStyle: FontStyle.normal,
      );
  static text400Normal14px(Color textColor,
          {bool? letterSpacing, bool? withUnderline, bool? isBold}) =>
      TextStyle(
        fontSize: 14,
        fontWeight: isBold ?? false ? FontWeight.bold : FontWeight.w400,
        letterSpacing: letterSpacing ?? false ? 0.1 : null,
        color: textColor,
        fontStyle: FontStyle.normal,
        decoration: withUnderline ?? false ? TextDecoration.underline : null,
      );
  static text400Normal16px(Color textColor,
          {bool? letterSpacing, bool? withUnderline}) =>
      TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: letterSpacing ?? false ? 0.1 : null,
        color: textColor,
        fontStyle: FontStyle.normal,
        decoration: withUnderline ?? false ? TextDecoration.underline : null,
      );

  static text400Normal28px(Color textColor,
          {bool? letterSpacing, bool? withUnderline}) =>
      TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w400,
        letterSpacing: letterSpacing ?? false ? 0.1 : null,
        color: textColor,
        fontStyle: FontStyle.normal,
        decoration: withUnderline ?? false ? TextDecoration.underline : null,
      );

  static text500Normal16px(Color textColor,
          {bool? letterSpacing, bool? isBold}) =>
      TextStyle(
        fontSize: 16,
        fontWeight: isBold ?? false ? FontWeight.bold : FontWeight.w500,
        fontStyle: FontStyle.normal,
        color: textColor,
      );

  static text500Normal12px(Color textColor,
          {bool? letterSpacing, bool? isBold}) =>
      TextStyle(
          fontSize: 12,
          fontWeight: isBold ?? false ? FontWeight.bold : FontWeight.w500,
          fontStyle: FontStyle.normal,
          letterSpacing: letterSpacing ?? false ? 0.1 : null,
          color: textColor);
  static text500Normal14px(Color textColor,
          {bool? letterSpacing, bool? isBold}) =>
      TextStyle(
          fontSize: 14,
          fontWeight: isBold ?? false ? FontWeight.bold : FontWeight.w500,
          fontStyle: FontStyle.normal,
          letterSpacing: letterSpacing ?? false ? 0.1 : null,
          color: textColor);

  static text500Normal28px(Color textColor, {bool? letterSpacing}) => TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      color: textColor);

  static text600Normal16px(Color textColor, {bool? letterSpacing}) => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        color: textColor,
      );
  static text600Normal18px(Color textColor, {bool? letterSpacing}) => TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        color: textColor,
      );
}

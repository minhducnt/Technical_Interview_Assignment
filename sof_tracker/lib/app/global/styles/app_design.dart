import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:sof_tracker/app/data/di.dart';
import 'package:sof_tracker/app/global/utils/ui_utils.dart';

/// All the design related constants
class AppDesign extends GetXState {
  static RoundedRectangleBorder roundedBorderCard(
    double radius1,
    double radius2,
    double radius3,
    double radius4,
  ) {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(radius1),
        bottomRight: Radius.circular(radius2),
        topLeft: Radius.circular(radius3),
        topRight: Radius.circular(radius4),
      ),
    );
  }

  static RoundedRectangleBorder roundedBorderWithSide(
    Color borderColor,
    double radius,
    bool isSetSide,
  ) {
    return RoundedRectangleBorder(
      side: BorderSide(color: borderColor, width: isSetSide ? 1.0 : 0),
      borderRadius: BorderRadius.circular(radius),
    );
  }

  static RoundedRectangleBorder roundedBorder(double radius) {
    return RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius));
  }

  static RoundedRectangleBorder halfRoundedBorder(
    Color borderColor,
    double radius1,
    double radius2,
    double radius3,
    double radius4,
    bool isSetSide,
  ) {
    return RoundedRectangleBorder(
      side: BorderSide(color: borderColor, width: isSetSide ? 1.0 : 0),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(radius1),
        bottomLeft: Radius.circular(radius2),
        topRight: Radius.circular(radius3),
        bottomRight: Radius.circular(radius4),
      ),
    );
  }

  static BoxDecoration boxDecorationContainerRoundHalf(
    Color color,
    double bradius1,
    double bradius2,
    double bradius3,
    double bradius4,
  ) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(bradius1),
        bottomLeft: Radius.circular(bradius2),
        topRight: Radius.circular(bradius3),
        bottomRight: Radius.circular(bradius4),
      ),
    );
  }

  static BoxDecoration boxDecorationContainerShadow(
    Color shadowColor,
    double bradius1,
    double bradius2,
    double bradius3,
    double bradius4,
    BuildContext context,
  ) {
    return BoxDecoration(
      color: Theme.of(context).colorScheme.surface,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(bradius1),
        bottomLeft: Radius.circular(bradius2),
        topRight: Radius.circular(bradius3),
        bottomRight: Radius.circular(bradius4),
      ),
      boxShadow: [
        BoxShadow(
          color: shadowColor,
          offset: const Offset(0, 2),
          blurRadius: 6,
        ),
      ],
    );
  }

  static BoxDecoration boxDecorationContainer(Color color, double radius) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
    );
  }

  static OutlineInputBorder outlineInputBorder(Color color, double radius) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(color: color),
    );
  }

  static BoxDecoration boxDecorationContainerHalf(Color color) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.r),
        topRight: Radius.circular(10.r),
      ),
    );
  }

  static BoxDecoration boxDecorationContainerBorder(
    Color borderColor,
    Color colorBackground,
    double radius, {
    bool status = false,
  }) {
    return BoxDecoration(
      color: colorBackground,
      border: Border.all(color: borderColor, width: !status ? 1 : 0.5),
      borderRadius: BorderRadius.circular(radius),
    );
  }

  static BoxDecoration boxDecorationContainerBorderCustom(
    Color borderColor,
    Color colorBackground,
    double radius,
  ) {
    return BoxDecoration(
      color: colorBackground,
      border: Border.all(color: borderColor, width: 0.5.w),
      borderRadius: BorderRadius.circular(radius),
    );
  }

  static BoxDecoration boxDecorationCircle(
    Color color,
    Color colorBackground,
    double radius,
  ) {
    return BoxDecoration(
      color: colorBackground,
      border: Border.all(color: color, width: 2.w),
      borderRadius: BorderRadius.circular(radius),
    );
  }

  static BoxDecoration circle(Color color) {
    return BoxDecoration(shape: BoxShape.circle, color: color);
  }

  static BoxDecoration boxCurveShadow(Color? color) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24.r),
        topRight: Radius.circular(24.r),
      ),
      boxShadow: [
        BoxShadow(
          color: Theme.of(gContext).colorScheme.shadow,
          blurRadius: 10,
          offset: const Offset(0, -9),
        ),
      ],
    );
  }

  static BoxDecoration boxDecorationContainerCardShadow(
    Color color,
    Color shadowColor,
    double radius,
    double x,
    double y,
    double b,
    double s,
  ) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      boxShadow: [
        BoxShadow(
          color: shadowColor,
          offset: Offset(x, y),
          blurRadius: b,
          spreadRadius: s,
        ),
      ],
    );
  }

  static BoxDecoration boxDecorationContainerShadow1(BuildContext context) {
    return BoxDecoration(
      color: Theme.of(context).colorScheme.onPrimary,
      shape: BoxShape.circle,
      boxShadow: const [
        BoxShadow(
          color: Color(0x0f292929),
          offset: Offset(0, 6),
          blurRadius: 10,
        ),
      ],
    );
  }

  static InputDecoration inputDecorationTextField(
    BuildContext context, {
    Color? borderColor,
    Color? fillColor,
    String? hintText,
    String? labelText,
    String? suffixText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool? isRequired,
    bool? isScreenTitle,
  }) {
    return InputDecoration(
      //* Options
      filled: true,
      isDense: true,
      border: InputBorder.none,
      floatingLabelBehavior: isScreenTitle == true ? FloatingLabelBehavior.never : FloatingLabelBehavior.auto,

      //* Text
      label: RichText(
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          text: labelText,
          style: isScreenTitle == true
              ? text12.copyWith(color: $r.theme.neutral)
              : text12.copyWith(color: $r.theme.neutral),
          children: [
            if (isScreenTitle == false)
              if (labelText?.isNotEmpty == true)
                if (isRequired == true)
                  const TextSpan(
                    text: ' *',
                    style: TextStyle(color: Colors.red),
                  ),
          ],
        ),
      ),
      hintText: hintText ?? '',
      hintStyle: text14.copyWith(color: $r.theme.neutral),
      fillColor: fillColor ?? $r.theme.neutral4,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      contentPadding: EdgeInsets.all(18.r),
      errorStyle: text12.copyWith(color: Theme.of(context).colorScheme.error),

      //* Border
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: borderColor ?? $r.theme.neutral2),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: $r.theme.neutral3),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
      ),
    );
  }

  static InputDecoration inputDecorationDropdown(
    BuildContext context, {
    Color? borderColor,
    Color? fillColor,
    String? hintText,
    String? labelText,
    Widget? suffixIcon,
    bool? isRequired,
    bool? isScreenTitle,
  }) {
    return InputDecoration(
      //* Options
      filled: true,
      isDense: true,
      border: InputBorder.none,
      constraints: BoxConstraints(minHeight: 50.h),

      //* Text
      label: RichText(
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          text: labelText,
          style: text14.copyWith(color: Theme.of(context).colorScheme.primary),
          children: [
            if (isScreenTitle == false)
              if (labelText?.isNotEmpty == true)
                if (isRequired == true)
                  TextSpan(text: ' *', style: TextStyle(color: Theme.of(context).colorScheme.error)),
          ],
        ),
      ),

      hintText: hintText ?? '',
      hintStyle: text12.semiBold.copyWith(color: $r.theme.neutral),
      fillColor: fillColor ?? Theme.of(context).colorScheme.onPrimary.withOpacity(0.2),
      suffixIcon: suffixIcon,
      contentPadding: EdgeInsets.all(18.r),
      errorStyle: text12.copyWith(color: Theme.of(gContext).colorScheme.error),

      //* Border
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: borderColor ?? $r.theme.neutral2),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: $r.theme.neutral3),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
      ),
    );
  }

  static Divider dividerSolid({double? height, double? thickness}) {
    return Divider(
      color: $r.theme.neutral2,
      height: height ?? 0.2,
      thickness: thickness ?? 0.2,
    );
  }

  static VerticalDivider dividerVerticalSolid({double? width, double? thickness}) {
    return VerticalDivider(
      color: Theme.of(gContext).colorScheme.surface.withOpacity(0.85),
      width: width ?? 0.2.w,
      thickness: thickness ?? 0.2,
    );
  }
}

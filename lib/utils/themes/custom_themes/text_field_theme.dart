import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppTextFormFieldTheme {
  AppTextFormFieldTheme._();
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    // errorMaxLines: 3,
    filled: true,
    // prefixIconColor: Colors.grey,
    // suffixIconColor: Colors.grey,
    // constraints: const BoxConstraints.expand (height: 14.inputFieldHeight),
    // labelStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.black),
    // hintStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.black),
    // errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    // floatingLabelStyle:
    //     const TextStyle().copyWith(color: Colors.black.withOpacity(0.8)),
    fillColor: const Color(0xFFF5F5F5),
    focusColor: Colors.white,
    errorMaxLines: 2,
    prefixIconColor: const Color(0xff7b7e8a),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(14.0)),
      borderSide: BorderSide(width: 1, color: Colors.grey),
    ),
    disabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(14.0)),
      borderSide: BorderSide(width: 1.6, color: Colors.grey),
    ),
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(14.0)),
      borderSide: BorderSide(width: 1.5, color: Colors.grey),
    ),
    focusedBorder: DecoratedInputBorder(
      child: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(14.0)),
        borderSide: BorderSide(width: 1.5, color: Colors.grey),
      ),
      shadow: const BoxShadow(
        color: Color.fromARGB(164, 158, 158, 158),
        blurRadius: 5,
      ),
    ),
    errorBorder: DecoratedInputBorder(
      child: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(14.0)),
        borderSide: BorderSide(width: 1.5, color: Colors.red),
      ),
      shadow: const BoxShadow(
        color: Color.fromARGB(164, 158, 158, 158),
        blurRadius: 5,
      ),
    ),

    focusedErrorBorder: DecoratedInputBorder(
      child: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(14.0)),
        borderSide: BorderSide(width: 1.5, color: Colors.orange),
      ),
      shadow: const BoxShadow(
        color: Color.fromARGB(164, 158, 158, 158),
        blurRadius: 5,
      ),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
// constraints: const BoxConstraints.expand (height: 14.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.black),
    hintStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle:
        const TextStyle().copyWith(color: Colors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: Colors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: Colors.grey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: Colors.black12),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: Colors.red),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 2, color: Colors.orange),
    ),
  );
}

class DecoratedInputBorder extends InputBorder {
  DecoratedInputBorder({
    required this.child,
    required this.shadow,
  }) : super(borderSide: child.borderSide);

  final InputBorder child;

  final BoxShadow shadow;

  @override
  bool get isOutline => child.isOutline;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) =>
      child.getInnerPath(rect, textDirection: textDirection);

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) =>
      child.getOuterPath(rect, textDirection: textDirection);

  @override
  EdgeInsetsGeometry get dimensions => child.dimensions;

  @override
  InputBorder copyWith(
      {BorderSide? borderSide,
      InputBorder? child,
      BoxShadow? shadow,
      bool? isOutline}) {
    return DecoratedInputBorder(
      child: (child ?? this.child).copyWith(borderSide: borderSide),
      shadow: shadow ?? this.shadow,
    );
  }

  @override
  ShapeBorder scale(double t) {
    final scalledChild = child.scale(t);

    return DecoratedInputBorder(
      child: scalledChild is InputBorder ? scalledChild : child,
      shadow: BoxShadow.lerp(null, shadow, t)!,
    );
  }

  @override
  void paint(Canvas canvas, Rect rect,
      {double? gapStart,
      double gapExtent = 0.0,
      double gapPercentage = 0.0,
      TextDirection? textDirection}) {
    final clipPath = Path()
      ..addRect(const Rect.fromLTWH(-5000, -5000, 10000, 10000))
      ..addPath(getInnerPath(rect), Offset.zero)
      ..fillType = PathFillType.evenOdd;
    canvas.clipPath(clipPath);

    final Paint paint = shadow.toPaint();
    final Rect bounds = rect.shift(shadow.offset).inflate(shadow.spreadRadius);

    canvas.drawPath(getOuterPath(bounds), paint);

    child.paint(canvas, rect,
        gapStart: gapStart,
        gapExtent: gapExtent,
        gapPercentage: gapPercentage,
        textDirection: textDirection);
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is DecoratedInputBorder &&
        other.borderSide == borderSide &&
        other.child == child &&
        other.shadow == shadow;
  }

  @override
  int get hashCode => Object.hash(borderSide, child, shadow);

  @override
  String toString() {
    return '${objectRuntimeType(this, 'DecoratedInputBorder')}($borderSide, $shadow, $child)';
  }
}

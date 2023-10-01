import 'package:flutter/material.dart';

/// A custom [Container] with [enable]
/// You can't do anything when it false (tab, drag, ... event)
class EnableWidget extends StatelessWidget {
  final bool enable;

  final Widget? child;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Color? disableColor;
  final Decoration? decoration;
  final Decoration? foregroundDecoration;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? margin;
  final Matrix4? transform;
  final AlignmentGeometry? transformAlignment;
  final Clip clipBehavior;
  final double? width;
  final double? height;

  const EnableWidget({
    super.key,
    this.alignment,
    this.padding,
    this.color,
    this.disableColor,
    this.decoration,
    this.foregroundDecoration,
    this.width,
    this.height,
    this.constraints,
    this.margin,
    this.transform,
    this.transformAlignment,
    this.child,
    this.clipBehavior = Clip.none,
    this.enable = false,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = enable ? color : disableColor ?? Colors.transparent;

    return Stack(
      children: [
        Container(
          alignment: alignment,
          padding: padding,
          color: color,
          decoration: decoration,
          foregroundDecoration: foregroundDecoration,
          width: width,
          height: height,
          constraints: constraints,
          margin: margin,
          transform: transform,
          transformAlignment: transformAlignment,
          clipBehavior: clipBehavior,
          child: Container(color: backgroundColor, child: child),
        ),
        if (!enable) Positioned(top: 0, bottom: 0, right: 0, left: 0, child: Container(color: Colors.transparent)),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pswdforget/constants.dart';

class Button extends TextButton {
  final double height, width;
  Button({
    Key? key,
    required super.onPressed,
    this.height = 45.0,
    this.width = double.infinity,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus = false,
    super.clipBehavior = Clip.antiAlias,
    String? label,
    String icon = '',
    Widget? son,
  }) : super(
          key: key,
          child: FractionallySizedBox(
            widthFactor: .8,
            child: Container(
              height: height,
              width: width,
              // padding: const EdgeInsets.symmetric(horizontal: 15.0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                color: mainClr,
              ),
              child: Center(
                child: Text(
                  label!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                  ),
                ),
              ),
            ),
          ),
        );
}

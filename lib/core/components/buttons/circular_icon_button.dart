import 'package:ecommerce_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class CircularIconButton extends StatelessWidget {
  const CircularIconButton(
      {super.key,
      required this.iconData,
      required this.voidCallback,
      this.iconColor,
      this.backgroundColor});
  final IconData iconData;
  final VoidCallback voidCallback;
  final Color? backgroundColor;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: voidCallback,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(10),
        // primary: backgroundColor ?? context.colors.onPrimary),
      ),
      child: Icon(
        iconData,
        color: iconColor ?? context.colors.primary,
        size: 20,
      ),
    );
  }
}

import 'package:ecommerce_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class PrimaryListTile extends StatelessWidget {
  const PrimaryListTile({
    super.key,
    required this.childWidget,
    this.onTap,
    this.onLongPress,
  });
  final Widget childWidget;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      onLongPress: onLongPress ?? () {},
      child: Card(
        color: context.colors.primary,
        child: SizedBox(
          height: 130,
          child: childWidget,
        ),
      ),
    );
  }
}

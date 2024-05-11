import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class OMOrderAction extends StatelessWidget {
  final VoidCallback onPressed;
  final String name;

  const OMOrderAction({
    required this.onPressed,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SizedBox(
        width: 400,
        height: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.secondaryHeaderColor.withAlpha(25),
          ),
          onPressed: onPressed,
          child: Text(
            name,
            style: AppFonts.normal25.copyWith(
              color: theme.indicatorColor,
            ),
          ),
        ),
      ),
    );
  }
}

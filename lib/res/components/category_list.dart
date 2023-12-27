import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  final String text;
  final VoidCallback onpress;
  const CategoryList({super.key, required this.text, required this.onpress});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onpress,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: theme.colorScheme.primaryContainer,
        ),
        child: Text(
          text,
          style: theme.textTheme.labelLarge!.copyWith(
            color: theme.colorScheme.onBackground,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
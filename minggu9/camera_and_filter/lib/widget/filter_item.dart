import 'dart:io';

import 'package:flutter/material.dart';

@immutable
class FilterItem extends StatelessWidget {
  final String imagePath;

  const FilterItem({super.key, required this.color, this.onFilterSelected, required this.imagePath});

  final Color color;
  final VoidCallback? onFilterSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onFilterSelected,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ClipOval(
            child: Image.file(
              File(imagePath),
              color: color.withOpacity(0.5),
              colorBlendMode: BlendMode.hardLight,
            ),
          ),
        ),
      ),
    );
  }
}

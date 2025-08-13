import 'package:flutter/material.dart';

class CustomProductTitle extends StatelessWidget {
  const CustomProductTitle({
    super.key,
    required this.title,
    this.maxlines = 1,
    this.isSmallSize = false,
    this.textAlign = TextAlign.start,
    this.large,
    this.small,
    this.textoverflow,
  });

  final String title;
  final int maxlines;
  final bool isSmallSize;
  final TextAlign textAlign;
  final double? large;
  final double? small;
  final TextOverflow? textoverflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxlines,
      overflow: textoverflow ?? TextOverflow.ellipsis,
      textAlign: textAlign,
      style: TextStyle(
        fontSize:
            isSmallSize
                ? (small ?? 14) // fallback if small is null
                : (large ?? 18), // fallback if large is null
        fontWeight: isSmallSize ? FontWeight.w400 : FontWeight.bold,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton({
    super.key,
    this.color = Colors.black,
    required this.title,
    this.radius = 16,
    this.textColor = Colors.black,
    this.borderColor = Colors.transparent,
    required this.onTap,
    this.padding,
  });

  final Color color;
  final Color textColor;
  final String title;
  final double radius;
  final Color borderColor;
  final VoidCallback onTap;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding == null ? EdgeInsets.zero : padding!,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(width: 1, color: borderColor),
          gradient: const LinearGradient(
            colors: [Color(0xff01001f), Color(0xff01001f)],
            stops: [0.68, 1],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )

        ),
        child: Material(
          borderRadius: BorderRadius.circular(radius),
          color: color,
          child: InkWell(
            borderRadius: BorderRadius.circular(radius),
            onTap: onTap,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  title,
                  style: const TextStyle(
                    fontFamily: "Mulish",
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffffffff),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

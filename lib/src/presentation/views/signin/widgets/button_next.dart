import 'package:felix_it_solutions_task/src/utils/resources/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonNext extends StatelessWidget {
  const ButtonNext({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: const Color(0xff01001F),
            boxShadow: const [
              BoxShadow(
                  color: Color(0xff01001F),
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  blurStyle: BlurStyle.normal)
            ]),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SvgPicture.asset(
            AppIcons.arrowRight,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}

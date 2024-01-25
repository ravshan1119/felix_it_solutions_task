import 'package:felix_it_solutions_task/src/config/router/app_routes.dart';
import 'package:felix_it_solutions_task/src/presentation/views/signin/widgets/button_next.dart';
import 'package:felix_it_solutions_task/src/presentation/views/signin/widgets/drop_down.dart';
import 'package:felix_it_solutions_task/src/utils/resources/app_icons.dart';
import 'package:felix_it_solutions_task/src/utils/resources/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInPageSplash extends StatelessWidget {
  const SignInPageSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppIcons.location),
                12.pw,
                const Text(
                  "FindSport",
                  style: TextStyle(
                    fontFamily: "K2D",
                    fontSize: 36,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff01001f),
                  ),
                  textAlign: TextAlign.left,
                )
              ],
            ),
            Column(
              children: [
                const DropDownItem(),
                18.ph,
                ButtonNext(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.signUpPage);
                  },
                ),
                64.ph,
              ],
            )
          ],
        ),
      ),
    );
  }
}

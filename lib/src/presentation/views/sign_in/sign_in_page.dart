import 'package:easy_localization/easy_localization.dart' as sign_in_page;
import 'package:felix_it_solutions_task/src/config/router/app_routes.dart';
import 'package:felix_it_solutions_task/src/domain/models/login_body_model.dart';
import 'package:felix_it_solutions_task/src/presentation/cubits/login/log_in_state.dart';
import 'package:felix_it_solutions_task/src/presentation/cubits/login/log_in_cubit.dart';
import 'package:felix_it_solutions_task/src/presentation/views/sign_up/widgets/app_text_field.dart';
import 'package:felix_it_solutions_task/src/presentation/views/sign_up/widgets/global_button.dart';
import 'package:felix_it_solutions_task/src/utils/constants/constants.dart';
import 'package:felix_it_solutions_task/src/utils/resources/app_images.dart';
import 'package:felix_it_solutions_task/src/utils/resources/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../translations/locale_keys.g.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogInCubit, LogInState>(
      listener: (context, state) {
        if (state.status == AppStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.error),
          ));
        }
        if (state.status == AppStatus.loaded) {
          Navigator.pushNamed(context, RouteNames.newAds);
        }
      },
      builder: (context, state) {
        if (state.status == AppStatus.loading) {
          return const ColoredBox(
            color: Colors.white,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
            elevation: 0,
            scrolledUnderElevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
            child: SingleChildScrollView(
                child: Column(
              children: [
                Center(
                  child: Image.asset(
                    AppImages.signUpImg,
                    height: MediaQuery.of(context).size.height * 0.35,
                  ),
                ),
                const Text(
                  "Log In",
                  style: TextStyle(
                    fontFamily: "Mulish",
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff01001f),
                  ),
                ),
                24.ph,
                AppTextField(
                  hintText: LocaleKeys.firstNameHint.tr(),
                  labelText: LocaleKeys.firstName.tr(),
                  controller: firstNameController,
                  keyboardType: TextInputType.name,
                ),
                12.ph,
                AppTextField(
                  hintText: LocaleKeys.passwordHint.tr(),
                  labelText: LocaleKeys.password.tr(),
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                ),
                12.ph,
                GlobalButton(
                  title: LocaleKeys.save.tr(),
                  onTap: () {
                    LoginBodyModel loginBodyModel = LoginBodyModel(
                      firstname: firstNameController.text,
                      password: passwordController.text,
                    );
                    if (firstNameController.text.isEmpty ||
                        passwordController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Заполните все поля"),
                      ));
                    } else {
                      setState(() {
                        BlocProvider.of<LogInCubit>(context)
                            .login(loginBodyModel);
                      });
                    }
                  },
                  radius: 6,
                  textColor: Colors.white,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, RouteNames.signUpPage);
                        },
                        child: const Text("Sign Up")),
                  ],
                )
              ],
            )),
          ),
        );
      },
    );
  }
}

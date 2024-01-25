import 'package:easy_localization/easy_localization.dart';
import 'package:felix_it_solutions_task/src/config/router/app_routes.dart';
import 'package:felix_it_solutions_task/src/domain/models/register_body_model.dart';
import 'package:felix_it_solutions_task/src/presentation/cubits/sign_up/sign_up_cubit.dart';
import 'package:felix_it_solutions_task/src/presentation/cubits/sign_up/sign_up_state.dart';
import 'package:felix_it_solutions_task/src/presentation/views/sign_up/widgets/app_text_field.dart';
import 'package:felix_it_solutions_task/src/presentation/views/sign_up/widgets/global_button.dart';
import 'package:felix_it_solutions_task/src/utils/constants/constants.dart';
import 'package:felix_it_solutions_task/src/utils/resources/app_images.dart';
import 'package:felix_it_solutions_task/src/utils/resources/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../translations/locale_keys.g.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
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
                Text(
                  LocaleKeys.auth.tr(),
                  style: const TextStyle(
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
                  hintText: LocaleKeys.lastNameHint.tr(),
                  labelText: LocaleKeys.lastName.tr(),
                  controller: lastNameController,
                  keyboardType: TextInputType.name,
                ),
                12.ph,
                AppTextField(
                  hintText: "(__) ___ - __ - __",
                  labelText: LocaleKeys.phone.tr(),
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                ),
                12.ph,
                AppTextField(
                  hintText: LocaleKeys.passwordHint.tr(),
                  labelText: LocaleKeys.password.tr(),
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                ),
                12.ph,
                AppTextField(
                  hintText: LocaleKeys.confirmPasswordHint.tr(),
                  labelText: LocaleKeys.confirmPassword.tr(),
                  controller: confirmPasswordController,
                  keyboardType: TextInputType.visiblePassword,
                ),
                12.ph,
                GlobalButton(
                  title: LocaleKeys.save.tr(),
                  onTap: () {
                    RegisterBodyModel registerBodyModel = RegisterBodyModel(
                      firstname: firstNameController.text,
                      lastname: lastNameController.text,
                      phone: phoneController.text,
                      password: passwordController.text,
                    );
                    if (confirmPasswordController.text !=
                        passwordController.text) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Пароли не совпадают"),
                      ));
                    }
                    if (firstNameController.text.isEmpty ||
                        lastNameController.text.isEmpty ||
                        phoneController.text.isEmpty ||
                        passwordController.text.isEmpty ||
                        confirmPasswordController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Заполните все поля"),
                      ));
                    } else {
                      setState(() {
                        BlocProvider.of<SignUpCubit>(context)
                            .register(registerBodyModel);
                      });
                    }
                  },
                  radius: 6,
                  textColor: Colors.white,
                ),
                12.ph,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, RouteNames.signInPage);
                        },
                        child: const Text("Log In")),
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

import 'package:easy_localization/easy_localization.dart';
import 'package:felix_it_solutions_task/src/domain/models/ads_body_model.dart';
import 'package:felix_it_solutions_task/src/presentation/cubits/ads_save/ads_cubit.dart';
import 'package:felix_it_solutions_task/src/presentation/cubits/ads_save/ads_state.dart';
import 'package:felix_it_solutions_task/src/presentation/views/new_ads/widgets/yandex.dart';
import 'package:felix_it_solutions_task/src/presentation/views/sign_up/widgets/app_text_field.dart';
import 'package:felix_it_solutions_task/src/utils/resources/app_icons.dart';
import 'package:felix_it_solutions_task/src/utils/resources/size_extension.dart';
import 'package:felix_it_solutions_task/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../utils/constants/constants.dart';

class NewAdsPage extends StatefulWidget {
  const NewAdsPage({super.key});

  @override
  State<NewAdsPage> createState() => _NewAdsPageState();
}

class _NewAdsPageState extends State<NewAdsPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdsSaveCubit, AdsSaveState>(
      listener: (context, state) {
        if (state.status == AppStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.error),
          ));
        }
        if (state.status == AppStatus.loaded) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Added successfully"),
          ));
        }
      },
      builder: (context, state) {
        if (state.status == AppStatus.loading) {
          return const ColoredBox(
              color: Colors.white,
              child: Center(
                child: CircularProgressIndicator(),
              ));
        }
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
            elevation: 0,
            scrolledUnderElevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    leading: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        AppIcons.exit,
                        height: 32,
                        width: 32,
                      ),
                    ),
                    trailing: GestureDetector(
                      onTap: () {
                        AdsBodyModel adsBodyModel = AdsBodyModel(
                          title: titleController.text,
                          description: descriptionController.text,
                          lot: 56,
                          lat: 41,
                        );
                        if (titleController.text.isEmpty ||
                            descriptionController.text.isEmpty) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("All fields are required"),
                          ));
                        }

                        context.read<AdsSaveCubit>().adsSave(adsBodyModel);
                        setState(() {
                          titleController.clear();
                          descriptionController.clear();
                          addressController.clear();
                        });
                      },
                      child: SvgPicture.asset(AppIcons.arrowRight),
                    ),
                    title: Text(
                      LocaleKeys.newAds.tr(),
                      style: const TextStyle(
                        fontFamily: "Mulish",
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff01001f),
                      ),
                    ),
                  ),
                  32.ph,
                  AppTextField(
                    hintText: LocaleKeys.title.tr(),
                    labelText: LocaleKeys.title.tr(),
                    controller: titleController,
                  ),
                  24.ph,
                  AppTextField(
                    hintText: LocaleKeys.descriptionHint.tr(),
                    labelText: LocaleKeys.description.tr(),
                    controller: descriptionController,
                    maxLines: 6,
                  ),
                  24.ph,
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: const Divider(
                              color: Colors.black,
                            )),
                        Text(
                          LocaleKeys.changeLocation.tr(),
                          style: const TextStyle(
                            fontFamily: "Mulish",
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff01001f),
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: const Divider(
                              color: Colors.black,
                            )),
                      ]),
                  24.ph,
                  AppTextField(
                    hintText: LocaleKeys.addressHint.tr(),
                    labelText: LocaleKeys.address.tr(),
                    controller: addressController,
                  ),
                  24.ph,
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Yandex()));
                      },
                      child: const Text("Yandex"))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:felix_it_solutions_task/src/domain/models/ads_body_model.dart';
import 'package:felix_it_solutions_task/src/presentation/cubits/ads_save/ads_cubit.dart';
import 'package:felix_it_solutions_task/src/presentation/cubits/ads_save/ads_state.dart';
import 'package:felix_it_solutions_task/src/presentation/views/sign_up/widgets/app_text_field.dart';
import 'package:felix_it_solutions_task/src/utils/resources/app_icons.dart';
import 'package:felix_it_solutions_task/src/utils/resources/size_extension.dart';
import 'package:felix_it_solutions_task/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../data/datasources/remote/yandex_service.dart';
import '../../../utils/constants/constants.dart';

class NewAdsPage extends StatefulWidget {
  const NewAdsPage({super.key});

  @override
  State<NewAdsPage> createState() => _NewAdsPageState();
}

class _NewAdsPageState extends State<NewAdsPage> {
  @override
  void initState() {
    _initPermission().ignore();
    super.initState();
  }

  final mapControllerCompleter = Completer<YandexMapController>();

  Future<void> _initPermission() async {
    if (!await LocationService().checkPermission()) {
      await LocationService().requestPermission();
    }
    await _fetchCurrentLocation();
  }

  Future<void> _fetchCurrentLocation() async {
    AppLatLong location;
    const defLocation = MoscowLocation();
    try {
      location = await LocationService().getCurrentLocation();
      addressController.text = "${location.lat}, ${location.long}";
    } catch (_) {
      location = defLocation;
    }
    _moveToCurrentLocation(location);
  }

  Future<void> _moveToCurrentLocation(
    AppLatLong appLatLong,
  ) async {
    (await mapControllerCompleter.future).moveCamera(
      animation: const MapAnimation(type: MapAnimationType.linear, duration: 1),
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: Point(
            latitude: appLatLong.lat,
            longitude: appLatLong.long,
          ),
          zoom: 12,
        ),
      ),
    );
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  double height = 0;
  double width = 0;

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
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
          body: Stack(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            fit: StackFit.passthrough,
            alignment: Alignment.bottomCenter,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 24 / 390),
                child: ListView(children: [
                  ListTile(
                    leading: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        AppIcons.exit,
                        height: height * 32 / 844,
                        width: height * 32 / 844,
                      ),
                    ),
                    trailing: GestureDetector(
                      onTap: () {
                        AdsBodyModel adsBodyModel = AdsBodyModel(
                          title: titleController.text,
                          description: descriptionController.text,
                          lot: double.parse(
                            addressController.text.split(", ")[0],
                          ),
                          lat: double.parse(
                            addressController.text.split(", ")[1],
                          ),
                        );
                        if (titleController.text.isEmpty ||
                            descriptionController.text.isEmpty) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("All fields are required"),
                          ));
                        } else {
                          context.read<AdsSaveCubit>().adsSave(adsBodyModel);
                          setState(() {
                            titleController.clear();
                            descriptionController.clear();
                            _fetchCurrentLocation();
                          });
                        }
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
                  12.ph,
                  AppTextField(
                    hintText: LocaleKeys.title.tr(),
                    labelText: LocaleKeys.title.tr(),
                    controller: titleController,
                    textInputAction: TextInputAction.next,
                  ),
                  12.ph,
                  AppTextField(
                    hintText: LocaleKeys.descriptionHint.tr(),
                    labelText: LocaleKeys.description.tr(),
                    controller: descriptionController,
                    textInputAction: TextInputAction.done,
                    maxLines: 4,
                  ),
                  12.ph,
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
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
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: const Divider(
                              color: Colors.black,
                            )),
                      ]),
                  12.ph,
                  AppTextField(
                    hintText: LocaleKeys.addressHint.tr(),
                    labelText: LocaleKeys.address.tr(),
                    controller: addressController,
                  ),
                ]),
              ),
              Positioned(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 3.5,
                  child: YandexMap(
                    mapObjects: [],
                    mapType: MapType.vector,
                    fastTapEnabled: true,
                    mode2DEnabled: true,
                    onMapCreated: (controller) async {
                      mapControllerCompleter.complete(controller);
                    },
                    onMapTap: (point) {
                      _moveToCurrentLocation(AppLatLong(
                        lat: point.latitude,
                        long: point.longitude,
                      ));
                      addressController.text =
                          "${point.latitude}, ${point.longitude}";
                      setState(() {});
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

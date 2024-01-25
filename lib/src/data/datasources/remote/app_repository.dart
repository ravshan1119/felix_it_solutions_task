import 'package:dio/dio.dart';
import 'package:felix_it_solutions_task/src/data/datasources/remote/api_call.dart';
import 'package:felix_it_solutions_task/src/domain/models/ads_body_model.dart';
import 'package:felix_it_solutions_task/src/domain/models/ads_save_response_model.dart';
import 'package:felix_it_solutions_task/src/domain/models/login_body_model.dart';
import 'package:felix_it_solutions_task/src/domain/models/login_response_model.dart';

import '../../../domain/models/register_body_model.dart';
import '../../../domain/models/register_response_model.dart';

class AppRepository {
  AppRepository({required this.apiCall});

  final ApiCall apiCall;

  Future<RegisterResponseModel> register(
    RegisterBodyModel registerBody,
  ) async {
    final client = ApiCall(
      Dio(
        BaseOptions(
          contentType: "application/json",
          baseUrl: "https://qutb.uz/api",
        ),
      ),
    );

    try {
      print("apprepository");
      final response = await apiCall.getRegister(registerBody);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<LoginResponseModel> login(
    LoginBodyModel loginBodyModel,
  ) async {
    final client = ApiCall(
      Dio(
        BaseOptions(
          contentType: "application/json",
          baseUrl: "https://qutb.uz/api",
        ),
      ),
    );

    try {
      print("apprepository");
      final response = await apiCall.getLogin(loginBodyModel);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<AdsSaveResponseModel> adsSave(
    AdsBodyModel adsBodyModel,
  ) async {
    final client = ApiCall(
      Dio(
        BaseOptions(
          contentType: "application/json",
          baseUrl: "https://qutb.uz/api",
        ),
      ),
    );

    try {
      print("apprepository");
      final response = await apiCall.getSave(adsBodyModel);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}

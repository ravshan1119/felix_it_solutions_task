import 'package:felix_it_solutions_task/src/domain/models/ads_body_model.dart';
import 'package:felix_it_solutions_task/src/domain/models/ads_save_response_model.dart';
import 'package:felix_it_solutions_task/src/domain/models/login_response_model.dart';
import 'package:felix_it_solutions_task/src/domain/models/register_body_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../../../domain/models/login_body_model.dart';
import '../../../domain/models/register_response_model.dart';

part 'api_call.g.dart';

class Apis {
  static const String baseUrl = "https://qutb.uz/api";
  static const String register = "/auth/register";
  static const String login = "/auth/login";
  static const String ads = "/ads";
}

@RestApi(baseUrl: Apis.baseUrl)
abstract class ApiCall {
  factory ApiCall(Dio dio, {String baseUrl}) = _ApiCall;

  @POST(Apis.register)
  Future<RegisterResponseModel> getRegister(
      @Body() RegisterBodyModel registerBody);

  @POST(Apis.login)
  Future<LoginResponseModel> getLogin(@Body() LoginBodyModel loginBody);

  @POST(Apis.ads)
  Future<AdsSaveResponseModel> getSave(@Body() AdsBodyModel adsBody);
}

import 'package:felix_it_solutions_task/src/domain/models/login_body_model.dart';
import 'package:felix_it_solutions_task/src/domain/models/login_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/datasources/remote/app_repository.dart';
import '../../../utils/constants/constants.dart';
import 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  final AppRepository repository;

  LogInCubit({required this.repository}) : super(LogInState.initial());

  Future<void> login(LoginBodyModel loginBodyModel) async {
    emit(state.copyWith(status: AppStatus.loading));
    try {
      final LoginResponseModel loginResponseModel =
          await repository.login(loginBodyModel);
      print("cubitdan:  ${loginResponseModel.token}");

      emit(state.copyWith(
        status: AppStatus.loaded,
        loginModel: loginResponseModel,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: AppStatus.error,
        error: e.toString(),
      ));
    }
  }
}

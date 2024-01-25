import 'package:felix_it_solutions_task/src/domain/models/register_body_model.dart';
import 'package:felix_it_solutions_task/src/domain/models/register_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/datasources/remote/app_repository.dart';
import '../../../utils/constants/constants.dart';
import 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AppRepository repository;

  SignUpCubit({required this.repository}) : super(SignUpState.initial());

  Future<void> register(RegisterBodyModel registerBodyModel) async {
    emit(state.copyWith(status: AppStatus.loading));
    try {
      final RegisterResponseModel registerModel =
          await repository.register(registerBodyModel);
      print("cubitdan:  ${registerModel.message}");

      emit(state.copyWith(
        status: AppStatus.loaded,
        registerModel: registerModel,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: AppStatus.error,
        error: e.toString(),
      ));
    }
  }
}

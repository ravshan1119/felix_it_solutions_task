import 'package:equatable/equatable.dart';
import 'package:felix_it_solutions_task/src/domain/models/register_response_model.dart';

import '../../../utils/constants/constants.dart';

class SignUpState extends Equatable {
  final AppStatus status;
  final RegisterResponseModel registerModel;
  final String error;

  const SignUpState(
      {required this.status, required this.registerModel, required this.error});

  factory SignUpState.initial() {
    return SignUpState(
        status: AppStatus.initial,
        registerModel: RegisterResponseModel(message: "", accessToken: ""),
        error: "");
  }

  @override
  List<Object?> get props => [status, registerModel, error];

  @override
  bool get stringify => true;

  SignUpState copyWith({
    AppStatus? status,
    RegisterResponseModel? registerModel,
    String? error,
  }) {
    return SignUpState(
      status: status ?? this.status,
      registerModel: registerModel ?? this.registerModel,
      error: error ?? this.error,
    );
  }
}

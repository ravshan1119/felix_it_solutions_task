import 'package:equatable/equatable.dart';
import 'package:felix_it_solutions_task/src/domain/models/login_response_model.dart';

import '../../../utils/constants/constants.dart';

class LogInState extends Equatable {
  final AppStatus status;
  final LoginResponseModel loginModel;
  final String error;

  const LogInState(
      {required this.status, required this.loginModel, required this.error});

  factory LogInState.initial() {
    return LogInState(
        status: AppStatus.initial,
        loginModel: LoginResponseModel(
            user: User(
                id: 0,
                firstname: "",
                lastname: "",
                phone: "",
                emailVerifiedAt: "",
                createdAt: DateTime.now(),
                updatedAt: DateTime.now()),
            token: ""),
        error: "");
  }

  @override
  List<Object?> get props => [status, loginModel, error];

  @override
  bool get stringify => true;

  LogInState copyWith({
    AppStatus? status,
    LoginResponseModel? loginModel,
    String? error,
  }) {
    return LogInState(
      status: status ?? this.status,
      loginModel: loginModel ?? this.loginModel,
      error: error ?? this.error,
    );
  }
}

import 'package:equatable/equatable.dart';
import 'package:felix_it_solutions_task/src/domain/models/ads_save_response_model.dart';

import '../../../utils/constants/constants.dart';

class AdsSaveState extends Equatable {
  final AppStatus status;
  final AdsSaveResponseModel adsModel;
  final String error;

  const AdsSaveState(
      {required this.status, required this.adsModel, required this.error});

  factory AdsSaveState.initial() {
    return AdsSaveState(
        status: AppStatus.initial,
        adsModel: AdsSaveResponseModel(
            title: "",
            description: "",
            lat: 0,
            updatedAt: DateTime.now(),
            createdAt: DateTime.now(),
            id: 0),
        error: "");
  }

  @override
  List<Object?> get props => [status, adsModel, error];

  @override
  bool get stringify => true;

  AdsSaveState copyWith({
    AppStatus? status,
    AdsSaveResponseModel? adsModel,
    String? error,
  }) {
    return AdsSaveState(
      status: status ?? this.status,
      adsModel: adsModel ?? this.adsModel,
      error: error ?? this.error,
    );
  }
}

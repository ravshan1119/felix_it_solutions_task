import 'package:felix_it_solutions_task/src/domain/models/ads_body_model.dart';
import 'package:felix_it_solutions_task/src/domain/models/ads_save_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/datasources/remote/app_repository.dart';
import '../../../utils/constants/constants.dart';
import 'ads_state.dart';

class AdsSaveCubit extends Cubit<AdsSaveState> {
  final AppRepository repository;

  AdsSaveCubit({required this.repository}) : super(AdsSaveState.initial());

  Future<void> adsSave(AdsBodyModel adsBodyModel) async {
    emit(state.copyWith(status: AppStatus.loading));
    try {
      final AdsSaveResponseModel adsSaveResponseModel =
          await repository.adsSave(adsBodyModel);
      print("cubitdan:  ${adsSaveResponseModel.title}");

      emit(state.copyWith(
        status: AppStatus.loaded,
        adsModel: adsSaveResponseModel,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: AppStatus.error,
        error: e.toString(),
      ));
    }
  }
}

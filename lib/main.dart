import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:felix_it_solutions_task/src/config/router/app_routes.dart';
import 'package:felix_it_solutions_task/src/data/datasources/remote/api_call.dart';
import 'package:felix_it_solutions_task/src/data/datasources/remote/app_repository.dart';
import 'package:felix_it_solutions_task/src/presentation/cubits/ads_save/ads_cubit.dart';
import 'package:felix_it_solutions_task/src/presentation/cubits/login/log_in_cubit.dart';
import 'package:felix_it_solutions_task/src/presentation/cubits/sign_up/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'generated/codegen_loader.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: const [
          Locale('ru'),
          Locale('uz'),
          Locale('en'),
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('ru'),
        assetLoader: const CodegenLoader(),
        child: const App()),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppRepository repository = AppRepository(apiCall: ApiCall(Dio()));

    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => SignUpCubit(repository: repository)),
      BlocProvider(create: (context) => LogInCubit(repository: repository)),
      BlocProvider(create: (context) => AdsSaveCubit(repository: repository)),
    ], child: const MainApp());
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}


import 'generated/l10n.dart';
import 'core/utils/theme.dart';
import 'core/di/server_locator.dart';
import 'package:flutter/material.dart';
import 'core/services/hive_service.dart';
import 'core/utils/my_bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/splash/views/splash_view.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'features/settings/models/app_user_pref.dart';
import 'features/home/presentation/manager/home_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'features/settings/presentation/manager/settings_cubit.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  setupLocator();
  HiveService.setupHive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // SettingsCubit 
        BlocProvider(create: (context) => getIt<SettingsCubit>()),

        // HomeCubit
        BlocProvider(create: (context) => getIt<HomeCubit>()),

      ],
      child: BlocBuilder<SettingsCubit, AppUserPref>(
        builder:(context, state) =>  ScreenUtilInit(
          designSize: const Size(390, 884),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              onGenerateTitle: (context) => S.of(context).appTitle,
              theme: AppTheme.light,
              themeMode: state.theme,
              darkTheme: AppTheme.dark,
              locale: Locale(state.lang),
              debugShowCheckedModeBanner: false,
              localizationsDelegates: [
                S.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              home: SplashView(),
            );
          },
        )
          )
      );
  }
}

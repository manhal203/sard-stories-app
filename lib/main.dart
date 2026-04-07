import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sard/core/theme/app_theme.dart';
import 'package:sard/features/settings/cubit/settings_cubit.dart';
import 'package:sizer/sizer.dart';
import 'package:get_it/get_it.dart';
import 'package:sard/core/bloc/app_bloc.dart';
import 'package:sard/core/config/config.dart';
import 'package:sard/features/favorites/cubit/favorite_cubit.dart';
import 'package:sard/routes/route_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Configuration.configureDependencies();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: BlocBuilder<SettingsCubit, SettingsInitial>(
        builder: (context, themeState) {
          return Sizer(
            builder: (context, orientation, screenType) {
              return MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) =>
                        AppBloc(GetIt.I.get(), GetIt.I.get())
                          ..add(LoadAppDataEvent()),
                  ),
                  BlocProvider(create: (context) => FavoriteCubit()),
                ],
                child: MaterialApp.router(
                  routerConfig: RouteApp.routers,
                  debugShowCheckedModeBanner: false,
                  theme: appLightTheme,
                  darkTheme: appDarkTheme,
                  themeMode: themeState.isDarkMode
                      ? ThemeMode.dark
                      : ThemeMode.light,
                ),
              );
            },
          );
        },
      ),
    );
  }
}

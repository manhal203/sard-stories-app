import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:sard/core/bloc/app_bloc.dart';
import 'package:sard/features/about/about_screen.dart';
import 'package:sard/features/auth/bloc/auth_bloc.dart';
import 'package:sard/features/auth/login_screen.dart';
import 'package:sard/features/auth/reset_password_screen.dart';
import 'package:sard/features/auth/signup_screen.dart';
import 'package:sard/features/auth/verify_email_screen.dart';
import 'package:sard/features/author/author_info_screen.dart';
import 'package:sard/features/author/bloc/author_bloc.dart';
import 'package:sard/features/category/category_detail_screen.dart';
import 'package:sard/features/nav_bar/controller_nav_bar.dart';
import 'package:sard/features/nav_bar/cubit/nav_bar_cubit.dart';
import 'package:sard/features/author/author_stories_screen.dart';
import 'package:sard/features/profile/profile_info_screen.dart';
import 'package:sard/features/settings/settings_screen.dart';
import 'package:sard/features/story/bloc/story_bloc.dart';
import 'package:sard/features/story/story_info_screen.dart';
import 'package:sard/features/story/story_screen.dart';
import 'package:sard/features/welcome/welcome_screen.dart';
import 'package:sard/models/category_model.dart';
import 'package:sard/models/story_model.dart';
import 'package:sard/routes/route_keys.dart';

abstract class RouteApp {
  static final routers = GoRouter(
    initialLocation: RouteKeys.welcomeScreen,
    routes: [
      GoRoute(
        path: RouteKeys.welcomeScreen,
        builder: (context, state) {
          return WelcomeScreen();
        },
      ),
      GoRoute(
        path: RouteKeys.loginScreen,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => AuthBloc(GetIt.I.get()),
            child: LoginScreen(),
          );
        },
      ),
      GoRoute(
        path: RouteKeys.signupScreen,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => AuthBloc(GetIt.I.get()),
            child: SignUpScreen(),
          );
        },
      ),
      GoRoute(
        path: RouteKeys.resetPasswordScreen,
        builder: (context, state) {
          return ResetPasswordScreen();
        },
      ),
      GoRoute(
        path: RouteKeys.verifyEmailScreen,
        builder: (context, state) {
          return VerifyEmailScreen();
        },
      ),
      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider(
            create: (context) => NavBarCubit(),
            child: ControllerNavBar(),
          );
        },
        routes: [
          GoRoute(
            path: RouteKeys.homeScreen,
            builder: (context, state) => SizedBox.shrink(),
          ),
        ],
      ),
      GoRoute(
        path: RouteKeys.settingsScreen,
        builder: (context, state) {
          return SettingsScreen();
        },
      ),
      GoRoute(
        path: RouteKeys.categoryDetailScreen,
        builder: (context, state) {
          final category = state.extra as CategoryModel;
          return BlocProvider(
            create: (context) => AppBloc(GetIt.I.get(), GetIt.I.get()),
            child: CategoryDetailScreen(category: category),
          );
        },
      ),
      GoRoute(
        path: RouteKeys.authorInfoScreen,
        builder: (context, state) {
          final authorId = state.extra as int;
          return BlocProvider(
            create: (context) =>
                AuthorBloc(GetIt.I.get())..add(LoadAuthorById(authorId)),
            child: AuthorInfoScreen(authorId: authorId),
          );
        },
      ),
      GoRoute(
        path: RouteKeys.authorStoriesScreen,
        builder: (context, state) {
          final authorId = state.extra as int;
          return BlocProvider(
            create: (context) => AuthorBloc(GetIt.I.get()),
            child: AuthorStoriesScreen(authorId: authorId),
          );
        },
      ),
      GoRoute(
        path: RouteKeys.profileInfoScreen,
        builder: (context, state) {
          return ProfileInfoScreen();
        },
      ),
      GoRoute(
        path: RouteKeys.storyInfoScreen,
        builder: (context, state) {
          final storyId = state.extra as int;
          return BlocProvider(
            create: (context) =>
                StoryBloc(GetIt.I.get())..add(LoadStoryById(storyId)),
            child: StoryInfoScreen(id: storyId),
          );
        },
      ),
      GoRoute(
        path: RouteKeys.storyScreen,
        builder: (context, state) {
          final story = state.extra as StoryModel;
          return BlocProvider(
            create: (context) => StoryBloc(GetIt.I.get()),
            child: StoryScreen(story: story),
          );
        },
      ),

      GoRoute(
        path: RouteKeys.aboutScreen,
        builder: (context, state) {
          return AboutScreen();
        },
      ),
    ],
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sard/features/category/category_screen.dart';
import 'package:sard/features/favorites/favorites_screen.dart';
import 'package:sard/features/home/home_screen.dart';
import 'package:sard/features/nav_bar/cubit/nav_bar_cubit.dart';
import 'package:sard/features/profile/profile_screen.dart';
import 'package:sard/features/search/search_screen.dart';
import 'nav_bar.dart';

class ControllerNavBar extends StatelessWidget {
  const ControllerNavBar({super.key});

  static final List<Widget> _navBarScreens = [
    const SearchScreen(),

    const FavoriteScreen(),
    const HomeScreen(),
    CategoryScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBarCubit, NavBarState>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: state.currentIndex,
            children: _navBarScreens,
          ),
          bottomNavigationBar: NavBar(
            currentIndex: state.currentIndex,
            onTap: (index) {
              context.read<NavBarCubit>().changeTab(index);
            },
          ),
        );
      },
    );
  }
}

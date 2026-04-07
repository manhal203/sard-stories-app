import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const NavBar({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: currentIndex,
      height: 60,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      color: Theme.of(context).primaryColor,
      buttonBackgroundColor: Theme.of(context).primaryColor,
      items: <Widget>[
        Icon(
          Icons.search,
          size: 30,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        Icon(
          Icons.favorite_border,
          size: 30,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        Icon(
          Icons.home_outlined,
          size: 30,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        Icon(
          Icons.category_outlined,
          size: 30,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        Icon(
          Icons.person_outline,
          size: 30,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ],
      onTap: onTap,
    );
  }
}

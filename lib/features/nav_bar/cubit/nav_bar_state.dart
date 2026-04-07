part of 'nav_bar_cubit.dart';

@immutable
sealed class NavBarState {
  final int currentIndex;
  const NavBarState(this.currentIndex);
}

final class NavBarInitial extends NavBarState {
  const NavBarInitial() : super(2);
}

final class NavBarChange extends NavBarState {
  const NavBarChange(super.currentIndex);
}

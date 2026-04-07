// settings_state.dart
part of 'settings_cubit.dart';

@immutable
sealed class SettingsState {}

final class SettingsInitial extends SettingsState {
  final bool isDarkMode;
  final bool isNotificationsOn;

  SettingsInitial({
    this.isDarkMode = false,
    this.isNotificationsOn = true,
  });

  SettingsInitial copyWith({
    bool? isDarkMode,
    bool? isNotificationsOn,
  }) {
    return SettingsInitial(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      isNotificationsOn: isNotificationsOn ?? this.isNotificationsOn,
    );
  }
}
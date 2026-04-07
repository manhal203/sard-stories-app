import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsInitial> {
  SettingsCubit() : super(SettingsInitial());

  void switchDarkMode(bool value) {
    emit(state.copyWith(isDarkMode: value));
  }

  void switchNotifications(bool value) {
    emit(state.copyWith(isNotificationsOn: value));
  }
}

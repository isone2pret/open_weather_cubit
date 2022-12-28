// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'temp_settings_cubit.dart';

enum TempUnit {
  celcius,
  fahrenheit,
}

class TempSettingsState extends Equatable {
  final TempUnit tempUnit;
  TempSettingsState({
    this.tempUnit = TempUnit.celcius,
  });

  @override
  List<Object> get props => [tempUnit];

  factory TempSettingsState.initial(){
    return TempSettingsState();
  }

  @override
  String toString() => 'TempSettingsState(tempUnit: $tempUnit';

  TempSettingsState copyWith({
    TempUnit? tempUnit,
  }) {
    return TempSettingsState(
      tempUnit: tempUnit ?? this.tempUnit,
    );
  }
}

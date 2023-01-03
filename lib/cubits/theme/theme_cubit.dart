import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:open_weather_cubit/constants/constans.dart';
import 'package:open_weather_cubit/cubits/weather/cubit/weather_cubit.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  late final StreamSubscription weatherSubcription;
  final WeatherCubit weatherCubit;

  ThemeCubit({required this.weatherCubit}) : super(ThemeState.initial()) {
    weatherSubcription =
        weatherCubit.stream.listen((WeatherState weatherState) {
      print('weatherState: $weatherState ');

      if (weatherState.weather.temp > kWarmOrNot) {
        emit(state.copyWith(appTheme: AppTheme.light));
      } else {
        emit(state.copyWith(appTheme: AppTheme.dark));
      }
    });
  }
  @override
  Future<void> close() {
    weatherSubcription.cancel();
    return super.close();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_weather_cubit/cubits/temp_settings/temp_settings_cubit.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListTile(
          title: const Text('Temperature Unit'),
          subtitle: const Text('Celcius/Fahrenheit (Default: Celcius'),
          trailing: Switch(
              value: context.watch<TempSettingsCubit>().state.tempUnit ==
                  TempUnit.celcius,
              onChanged: (_) {
                context.read<TempSettingsCubit>().toggleTempUnit();
              }),
        ),
      ),
    );
  }
}

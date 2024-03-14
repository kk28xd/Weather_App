import 'package:f_project/Pages/Search_Page.dart';
import 'package:f_project/Widgets/exit_weather.dart';
import 'package:f_project/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Widgets/No_Weather.dart';
import '../cubits/get_weather_cubit/get_weather_states.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Weather App'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('search');
              },
              icon: const Icon(
                Icons.search,
              ))
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is ThereIsNoWeather) {
            return const NoWeather();
          } else if (state is WeatherLoaded) {
            return ExitWeather();
          } else {
            return const Text('There was an error');
          }
        },
      ),
    );
  }
}

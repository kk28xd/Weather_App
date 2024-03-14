import 'package:f_project/services/WeatherModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/get_weather_cubit/get_weather_cubit.dart';
import '../main.dart';

class ExitWeather extends StatefulWidget {
  const ExitWeather({super.key});

  @override
  State<ExitWeather> createState() => _ExitWeatherState();
}

class _ExitWeatherState extends State<ExitWeather> {
  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              getMaterialColorForWeather(weatherModel!.WeatherState),
              getMaterialColorForWeather(weatherModel.WeatherState)[300]!,
              getMaterialColorForWeather(weatherModel.WeatherState)[100]!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(weatherModel!.CityName,
              style:
                  const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          Text(
              'updated at ${weatherModel.Date.hour}:${weatherModel.Date.minute}',
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image(
                  image: NetworkImage('https:${weatherModel.Img}'),
                  height: 95,
                  width: 95),
              Text('${weatherModel.CurrentTemp.round()}',
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold)),
              Column(
                children: [
                  Text('maxTemp : ${weatherModel.MaxTemp.round()}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('minTemp : ${weatherModel.MinTemp.round()}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(weatherModel.WeatherState,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}

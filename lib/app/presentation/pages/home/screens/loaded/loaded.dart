import 'package:flutter/material.dart';
import 'package:flutter_weather_app/app/presentation/bloc/home_page/home_page_bloc.dart';
import 'package:flutter_weather_app/app/presentation/pages/home/widgets/app_bar/app_bar.dart';
import 'package:flutter_weather_app/app/presentation/widgets/card/center_icon_card/center_icon_card.dart';
import 'package:flutter_weather_app/app/presentation/widgets/card/image_bottom_text_card/image_bottom_text_card.dart';
import 'package:flutter_weather_app/app/presentation/widgets/card/temperature_display/temperature_display.dart';
import 'package:flutter_weather_app/app/presentation/widgets/text/app_date_display/app_date_display.dart';
import 'package:flutter_weather_app/app/presentation/widgets/text/icon_text/icon_text.dart';
import 'package:flutter_weather_app/utils/date_resolver.dart';
import 'package:flutter_weather_app/utils/image_resolver.dart';

class HomeLoadedScreen extends StatelessWidget {
  final HomePageLoaded state;
  final HomePageBloc bloc;

  HomeLoadedScreen({
    Key? key,
    required this.state,
    required this.bloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(location: state.weather.location),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                ImageBottomTextCard(
                  state.weather.condition,
                  margin: EdgeInsets.symmetric(vertical: 20),
                  image: Image.asset(
                    state.weather.image ?? ImageResolver.dayCloudy,
                  ),
                ),
                TemperatureDisplay('${state.weather.temperature.round()}'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconText(
                      '${state.weather.windSpeed} km/h',
                      icon: Image.asset(ImageResolver.wind),
                    ),
                    SizedBox(width: 20),
                    IconText(
                      '${state.weather.airHumidity} %',
                      icon: Image.asset(ImageResolver.airHumidity),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(height: 18, child: buildForecastDatesList()),
          SizedBox(height: 20),
          Container(
            height: 180,
            child: buildForecastItems(context),
          ),
        ],
      ),
    );
  }

  ListView buildForecastItems(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      itemCount: state.forecasts.length,
      itemBuilder: (_, index) => Align(
        alignment: Alignment.topCenter,
        child: CenterIconCard(
          DateResolver.parseHour(state.forecasts[index].time),
          margin: EdgeInsets.only(left: 15),
          subText: '${state.forecasts[index].temperature.round().toString()}°',
          middle: state.forecasts[index].image == null
              ? null
              : Image.network('http:${state.forecasts[index].image}'),
        ),
      ),
    );
  }

  ListView buildForecastDatesList() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      itemCount: state.forecastDates.length,
      itemBuilder: (_, index) => Container(
        width: 100,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: AppDateDisplay(
          date: state.forecastDates[index],
          selected: state.selectedDate == index,
          onTap: () => bloc.add(ChangeForecastDate(index)),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_weather_app/app/presentation/bloc/home_page/home_page_bloc.dart';
import 'package:flutter_weather_app/app/presentation/pages/home/screens/loaded/styles.dart';
import 'package:flutter_weather_app/app/presentation/widgets/card/center_icon_card/center_icon_card.dart';
import 'package:flutter_weather_app/app/presentation/widgets/card/image_bottom_text_card/image_bottom_text_card.dart';
import 'package:flutter_weather_app/app/presentation/widgets/text/app_date_display/app_date_display.dart';
import 'package:flutter_weather_app/app/presentation/widgets/text/icon_text/icon_text.dart';
import 'package:flutter_weather_app/utils/image_resolver.dart';

class HomeLoadedScreen extends StatelessWidget with HomeLoadedScreenStyles {
  final HomePageLoaded state;

  HomeLoadedScreen({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                ImageBottomTextCard(
                  state.weather.condition,
                  margin: EdgeInsets.only(bottom: 20),
                  image: Image.asset(
                    state.weather.image ?? ImageResolver.dayCloudy,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  alignment: Alignment.center,
                  child: Text(
                    '${state.weather.temperature.round()} °',
                    style: temperatureStyle(context),
                  ),
                ),
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
      itemCount: 3,
      itemBuilder: (_, index) => Align(
        alignment: Alignment.topCenter,
        child: CenterIconCard(
          '09:00 AM',
          subText: '30 °',
          icon: Icons.add,
          margin: EdgeInsets.only(left: 15),
        ),
      ),
    );
  }

  ListView buildForecastDatesList() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      itemCount: 3,
      itemBuilder: (_, index) => Container(
        width: 100,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: AppDataDisplay(date: state.weather.forecasts?[index].time),
      ),
    );
  }
}

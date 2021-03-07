import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/app/presentation/bloc/home_page/home_page_bloc.dart';
import 'package:flutter_weather_app/injection_container.dart' as ic;
import 'package:flutter_weather_app/utils/image_resolver.dart';

class HomePage extends StatelessWidget {
  final bloc = ic.get<HomePageBloc>();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return BlocBuilder(
      bloc: (bloc as HomePageBloc)..add(GetWeatherByCityName('goiania')),
      builder: (_, state) => state is HomePageLoaded
          ? Scaffold(
              appBar: AppBar(),
              body: Center(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    Container(
                      height: screenHeight * .2,
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: Image.asset(
                        state.weather.image ?? ImageResolver.dayCloudy,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      alignment: Alignment.center,
                      child: Text(
                        state.weather.condition,
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      alignment: Alignment.center,
                      child: Text(
                        '${state.weather.temperature.round()} °',
                        style: TextStyle(
                          fontSize: 74,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Image.asset(ImageResolver.wind, height: 28),
                              SizedBox(width: 5),
                              Text('${state.weather.windSpeed} km/h'),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                          child: Row(
                            children: [
                              Image.asset(
                                ImageResolver.airHumidity,
                                height: 28,
                              ),
                              Text('${state.weather.airHumidity} %'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                    Container(
                      height: 16,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (_, __) => Container(
                          width: 150,
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Placeholder(),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      height: 170,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (_, __) => Container(
                          width: 135,
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Placeholder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Container(),
    );
  }
}

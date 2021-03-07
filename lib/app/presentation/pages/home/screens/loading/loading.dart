import 'package:flutter/material.dart';
import 'package:flutter_weather_app/app/presentation/pages/home/screens/loading/styles.dart';
import 'package:flutter_weather_app/consts/app_theme.dart';
import 'package:shimmer/shimmer.dart';

class HomeLoadingScreen extends StatelessWidget with HomeLoadingScreenStyles {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: screenBackground(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
        body: Center(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              addShimmer(
                Container(
                  height: screenHeight * .2,
                  width: 250,
                  decoration: containersDecoration(),
                  margin: conditionImageMargin(),
                ),
              ),
              addShimmer(
                Container(
                  height: 18,
                  width: 150,
                  decoration: containersDecoration(),
                  margin: temperatureItemsDefaultMargin(),
                ),
              ),
              addShimmer(
                Container(
                  height: screenHeight * .17,
                  width: 210,
                  decoration: containersDecoration(),
                  margin: temperatureItemsDefaultMargin(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  addShimmer(Container(
                    height: 14,
                    width: 100,
                    decoration: containersDecoration(),
                  )),
                  SizedBox(width: 20),
                  addShimmer(
                    Container(
                      height: 14,
                      width: 100,
                      decoration: containersDecoration(),
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
                  itemBuilder: (_, __) => addShimmer(
                    Container(
                      height: 16,
                      width: 150,
                      decoration: containersDecoration(),
                      margin: forecastItemsMargin(),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 170,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (_, __) => addShimmer(
                    Container(
                      width: 135,
                      decoration: containersDecoration(),
                      height: 170,
                      margin: forecastItemsMargin(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget addShimmer(Widget child) {
    return Shimmer.fromColors(
      baseColor: AppTheme.shimmerBase,
      highlightColor: AppTheme.shimmerHighlight,
      child: UnconstrainedBox(child: child),
    );
  }
}

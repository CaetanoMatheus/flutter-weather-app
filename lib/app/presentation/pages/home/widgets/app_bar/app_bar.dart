import 'package:flutter/material.dart';
import 'package:flutter_weather_app/app/data/models/location.dart';
import 'package:flutter_weather_app/app/presentation/bloc/home_page/home_page_bloc.dart';
import 'package:flutter_weather_app/app/presentation/pages/home/widgets/app_bar/styles.dart';

class HomeAppBar extends StatelessWidget
    with HomeAppBarStyles
    implements PreferredSizeWidget {
  final HomePageLoaded state;
  final HomePageBloc bloc;

  HomeAppBar({Key? key, required this.state, required this.bloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      title: Text(state.weather.location?.name ?? ''),
      actions: [
        IconButton(
          onPressed: () => buildCityInput(context),
          icon: Icon(
            Icons.search,
            color: Theme.of(context).textTheme.bodyText1?.color,
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.place,
            color: Theme.of(context).textTheme.bodyText1?.color,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Future buildCityInput(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) => TextField(
        autofocus: true,
        cursorColor: Theme.of(context).textTheme.bodyText1?.color,
        cursorHeight: 26,
        cursorRadius: Radius.circular(50),
        style: TextStyle(fontSize: 20),
        decoration: inputDecoration('Enter the city name'),
        onSubmitted: (String value) {
          bloc.add(GetWeatherFromInputValue(value));
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

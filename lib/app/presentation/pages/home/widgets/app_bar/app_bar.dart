import 'package:flutter/material.dart';
import 'package:flutter_weather_app/app/data/models/location.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Location? location;

  HomeAppBar({Key? key, this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      title: Text(location?.name ?? ''),
      actions: [
        IconButton(
          icon: Icon(
            Icons.search,
            color: Theme.of(context).textTheme.bodyText1?.color,
          ),
          onPressed: () {},
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

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

import 'package:vrouter/vrouter.dart';

import 'package:flutter_weather_app/app/presentation/pages/home/home_page.dart';

List<VRouteElement> routes = [VStacked(path: '/', widget: HomePage())];

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_app/app/domain/entities/location_entity.dart';

import 'package:flutter_weather_app/main.dart';

void main() {
  test('Counter increments smoke test', () {
    var a = Location('Goiania', 123, 123);
    a.name = 'asdasd';
    print(a.name);
    print(a.latitude);
    print(a.longitude);
  });
}

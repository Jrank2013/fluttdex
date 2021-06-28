import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget createTestableWidget(Widget widget) {
  return MediaQuery(
    data: const MediaQueryData(),
    child: MaterialApp(home: widget),
  );
}

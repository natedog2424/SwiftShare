import 'package:flutter/material.dart';

class TabbedPage {
  final String title;
  final IconData icon;

  WidgetBuilder builder;

  TabbedPage({
    required this.title,
    required this.icon,
    required this.builder,
  });
}

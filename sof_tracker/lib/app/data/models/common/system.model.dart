import 'package:flutter/material.dart';

class OverviewReport {
  final String title;
  void Function()? onTap;
  String? value;

  OverviewReport({
    required this.title,
    this.value,
    this.onTap,
  });
} 

class HomeTabInfo {
  final dynamic icon;
  final dynamic selectedIcon;
  final double? iconSize;
  final String title;
  final Widget widget;
  final bool hasBadge;

  HomeTabInfo({
    required this.icon,
    required this.selectedIcon,
    required this.title,
    required this.widget,
    this.iconSize,
    this.hasBadge = false,
  });
}

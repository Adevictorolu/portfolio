import 'package:flutter/material.dart';

class ServiceItem {
  final String id;
  final String title;
  final String description;
  final IconData iconData;
  final List<String> deliverables;
  final int startingNgn;
  final int startingUsd;
  final String turnaround;

  const ServiceItem({
    required this.id,
    required this.title,
    required this.description,
    required this.iconData,
    required this.deliverables,
    required this.startingNgn,
    required this.startingUsd,
    required this.turnaround,
  });
}

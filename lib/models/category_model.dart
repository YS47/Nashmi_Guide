import 'package:flutter/material.dart';

class CategoryModel {
  final int id;
  final String name;
  final IconData icon;
  final String description;
  final Color color;

  CategoryModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.description,
    required this.color,
  });
}

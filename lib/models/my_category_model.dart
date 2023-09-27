import 'package:flutter/material.dart';

enum MyCategory {
  fruits(
    title: 'Fruits',
    image: 'assets/images/fruits',
    color: Color(0xFFFCE4EC),
  ),
  vegetable(
    title: 'Vegetable',
    image: 'assets/images/vegetable',
    color: Color(0xFFDCEDC8),
  ),
  dairy(
    title: 'Dairy',
    image: 'assets/images/dairy',
    color: Color(0xFFB3E5FC),
  ),
  meat(
    title: 'Meat',
    image: 'assets/images/meat',
    color: Color(0xFFFFCDD2),
  ),
  others(
    title: 'Others',
    image: 'assets/images/others',
    color: Color(0xFFCFD8DC),
  );

  final String title;
  final String image;
  final Color color;
  const MyCategory({
    required this.title,
    required this.image,
    required this.color,
  });
}

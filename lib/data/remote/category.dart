import 'package:flutter/material.dart';

class Category {
  final String text;
  final Icon icon;

  const Category({
    required this.text,
    required this.icon,
  });

  Category copyWith({
    String? text,
    Icon? icon,
  }) {
    return Category(
      text: text ?? this.text,
      icon: icon ?? this.icon,
    );
  }
}
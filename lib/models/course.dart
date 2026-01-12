import 'package:flutter/material.dart';

/// Datenmodell für einen Kurs
class Course {
  final String id;
  final String title;
  final String duration;
  final String description;
  final String detailContent; // Langer Text für Detailseite
  final String imagePath;
  final Color color; // Hintergrundfarbe für UI-Darstellung
  bool isCompleted;

  Course({
    required this.id,
    required this.title,
    required this.duration,
    required this.description,
    required this.detailContent,
    required this.imagePath,
    required this.color,
    this.isCompleted = false,
  });
}

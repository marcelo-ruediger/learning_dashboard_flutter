import "package:flutter/material.dart";
import "../models/course.dart";
import "../constants/app_constants.dart";

/// Detail-Ansicht eines einzelnen Kurses
class CourseDetailScreen extends StatelessWidget {
  final Course course;

  const CourseDetailScreen({required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstants.detailTitle),
        centerTitle: true,
        backgroundColor: Colors.grey[300],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppConstants.paddingLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Content-Box mit Kursfarbe als Hintergrund
            Container(
              padding: EdgeInsets.all(AppConstants.paddingLarge),
              decoration: BoxDecoration(
                color: course.color,
                borderRadius: BorderRadius.circular(
                  AppConstants.borderRadiusMedium,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.title,
                    style: TextStyle(
                      fontSize: AppConstants.fontSizeTitle,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: AppConstants.paddingLarge),
                  Text(
                    course.detailContent,
                    style: TextStyle(fontSize: AppConstants.fontSizeLarge),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppConstants.paddingExtraLarge),
            Center(
              child: ElevatedButton(
                // Button disabled wenn bereits abgeschlossen
                onPressed: course.isCompleted
                    ? null
                    : () {
                        // Zurück zur Liste mit Erfolgs-Signal
                        Navigator.pop(context, true);
                      },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(
                    AppConstants.buttonMinWidth,
                    AppConstants.buttonMinHeight,
                  ),
                ),
                child: Text(
                  course.isCompleted
                      ? AppConstants.buttonAlreadyCompleted
                      : AppConstants.buttonComplete,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

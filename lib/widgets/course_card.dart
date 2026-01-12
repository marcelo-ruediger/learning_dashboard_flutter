import "package:flutter/material.dart";
import "../models/course.dart";
import "../constants/app_constants.dart";

/// Wiederverwendbare Card-Komponente für einen Kurs
class CourseCard extends StatelessWidget {
  final Course course;
  final VoidCallback onTap;

  const CourseCard({required this.course, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppConstants.paddingLarge),
      decoration: BoxDecoration(
        color: course.color,
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
          splashColor: Colors.black.withValues(alpha: 0.15),
          highlightColor: Colors.black.withValues(alpha: 0.08),
          onTap: onTap,
          child: Row(
            children: [
              Container(
                width: AppConstants.courseImageSize,
                height: AppConstants.courseImageSize,
                padding: EdgeInsets.all(AppConstants.paddingMedium),
                child: Image.asset(course.imagePath, fit: BoxFit.contain),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(AppConstants.paddingMedium),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        course.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: AppConstants.fontSizeLarge,
                        ),
                      ),
                      SizedBox(height: AppConstants.paddingSmall),
                      Text(
                        course.duration,
                        style: TextStyle(fontSize: AppConstants.fontSizeMedium),
                      ),
                      SizedBox(height: AppConstants.paddingSmall),
                      Text(
                        course.description,
                        style: TextStyle(fontSize: AppConstants.fontSizeSmall),
                      ),
                      SizedBox(height: AppConstants.paddingSmall),
                      Text(
                        course.isCompleted
                            ? AppConstants.statusCompleted
                            : AppConstants.statusOpen,
                        style: TextStyle(
                          fontSize: AppConstants.fontSizeSmall,
                          fontWeight: FontWeight.w500,
                          color: course.isCompleted
                              ? Colors.green[700]
                              : Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

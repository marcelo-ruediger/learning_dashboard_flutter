import "package:flutter/material.dart";
import "../models/course.dart";
import "../constants/app_constants.dart";
import "../widgets/course_card.dart";
import "course_detail_screen.dart";

/// Haupt-Dashboard: Zeigt Liste aller Kurse
class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Course> courses = [
    Course(
      id: "1",
      title: "It-Sicherheit",
      duration: "Dauer: 30 min",
      description: "Grundlagen der IT-Sicherheit",
      detailContent:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
          "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
          "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris "
          "nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in "
          "reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
      imagePath: "assets/it_sicherheit.png",
      color: Colors.blue.shade100,
      isCompleted: false,
    ),

    Course(
      id: "2",
      title: "Compliance Basics",
      duration: "Dauer: 25 min",
      description: "Wichtige Compliance-Regeln",
      detailContent:
          "Excepteur sint occaecat cupidatat non proident, sunt in culpa "
          "qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde "
          "omnis iste natus error sit voluptatem accusantium doloremque laudantium, "
          "totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi "
          "architecto beatae vitae dicta sunt explicabo.",
      imagePath: "assets/compliance.png",
      color: Colors.green.shade100,
      isCompleted: false,
    ),

    Course(
      id: "3",
      title: "Datenschutz",
      duration: "Dauer: 15 min",
      description: "Einführung in den Datenschutz",
      detailContent:
          "Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut "
          "odit aut fugit, sed quia consequuntur magni dolores eos qui ratione "
          "voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum "
          "quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam "
          "eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.",
      imagePath: "assets/datenschutz.png",
      color: Colors.purple.shade100,
      isCompleted: false,
    ),

    Course(
      id: "4",
      title: "Arbeitsschutz",
      duration: "Dauer: 20 min",
      description: "Sicherheit und Gesundheit am Arbeitsplatz",
      detailContent:
          "Ut enim ad minima veniam, quis nostrum exercitationem ullam "
          "corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur. "
          "Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam "
          "nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas "
          "nulla pariatur. At vero eos et accusamus et iusto odio dignissimos.",
      imagePath: "assets/arbeitsschutz.png",
      color: Colors.orange.shade100,
      isCompleted: false,
    ),
  ];

  /// Markiert einen Kurs als abgeschlossen
  void _completeCourse(int index) {
    setState(() {
      courses[index].isCompleted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstants.dashboardTitle),
        centerTitle: true,
        backgroundColor: Colors.grey[300],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(AppConstants.paddingLarge),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return CourseCard(
            course: course,
            onTap: () async {
              // Navigation zur Detailseite und warten auf Rückgabewert
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CourseDetailScreen(course: course),
                ),
              );

              // Status aktualisieren wenn Kurs abgeschlossen wurde
              if (result == true) {
                _completeCourse(index);
              }
            },
          );
        },
      ),
    );
  }
}

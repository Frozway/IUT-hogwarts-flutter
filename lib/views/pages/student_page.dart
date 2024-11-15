import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lefrancois_thibaut_y2_flutter/services/student_service.dart';
import 'package:lefrancois_thibaut_y2_flutter/views/atoms/list_item.dart';
import 'package:lefrancois_thibaut_y2_flutter/views/molecules/list_view_item.dart';
import 'package:lefrancois_thibaut_y2_flutter/views/templates/main_template.dart';

import '../../cubit/student/student_cubit.dart';

class StudentsPage extends StatelessWidget {
  const StudentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainTemplate(
      title: "Students",
      body: BlocProvider(
        create: (context) => StudentCubit(StudentService())..fetchStudents(),
        child: BlocBuilder<StudentCubit, StudentState>(
          builder: (context, state) {
            if (state is StudentLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is StudentLoaded) {
              return ListViewItem(items:
                state.students.map((student) => ListItem(
                  imageUrl: student.picture,
                  title: '${student.firstName} ${student.lastName}',
                  subtitle: student.house,
                )).toList(),
              );
            } else if (state is StudentError) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text('No students found'));
            }
          },
        ),
      ),
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:lefrancois_thibaut_y2_flutter/models/student.dart';
import 'package:lefrancois_thibaut_y2_flutter/services/student_service.dart';

part 'student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  final StudentService studentService;

  StudentCubit(this.studentService) : super(StudentInitial());

  Future<void> fetchStudents() async {
    try {
      emit(StudentLoading());
      final students = await studentService.fetchStudents();
      emit(StudentLoaded(students));
    } catch (e) {
      emit(const StudentError('Failed to load students :  '));
    }
  }
}
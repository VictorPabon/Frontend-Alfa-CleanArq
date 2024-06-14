import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:alpha_gymnastic_center/infraestructure/presentation/widgets/scrollHorizontal.dart';
import 'package:alpha_gymnastic_center/aplication/use_cases/courses/get_course_data_use_case.dart';
import 'package:alpha_gymnastic_center/aplication/BLoC/course/course_many/course_many_bloc.dart';
import 'package:alpha_gymnastic_center/aplication/BLoC/course/course_many/course_many_state.dart';
import 'package:alpha_gymnastic_center/aplication/BLoC/course/course_many/course_many_event.dart';

class PopularProcessesCarousel extends StatelessWidget {
  const PopularProcessesCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CourseListBloc(GetIt.instance<GetCourseDataUseCase>())
            ..add(const LoadCourseList(courseId: '1', page: 1, perPage: 5)),
      child: BlocBuilder<CourseListBloc, CourseListState>(
        builder: (context, state) {
          if (state is CourseListLoading) {
            return const CircularProgressIndicator();
          } else if (state is CourseListLoaded) {
            final course =
                state.courses.firstWhere((course) => course.id == "1");
            if (course != null) {
              return SizedBox(
                height: 195,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ScrollHorizontal(
                      titulo: course.trainer.name,
                      descripcion: course.title,
                      categoria: course.category,
                      fecha: course.date.toString(),
                      foto: course.image,
                      disposicion: 1,
                      isNew: false,
                      conexion: "/videos",
                    ),
                  ],
                ),
              );
            } else {
              return Text('No se encontró el curso con el ID "1".');
            }
          } else if (state is CourseListFailed) {
            return Text('Error: ${state.failure}');
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}

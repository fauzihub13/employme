import 'package:bloc/bloc.dart';
import 'package:employme/data/datasource/job_remote_datasources.dart';
import 'package:employme/presentation/job/bloc/bloc/job_state.dart';
import 'package:flutter/material.dart';

part 'job_event.dart';

class JobBloc extends Bloc<JobEvent, JobState> {
  final JobRemoteDatasources jobRemoteDatasources;

  JobBloc({required this.jobRemoteDatasources}) : super(JobInitial()) {
    on<GetJobList>((event, emit) async {
      emit(JobLoading());

      final result = await jobRemoteDatasources.getJobList();

      result.fold((error) {
        emit(JobError(error: error));
      }, (value) {
        emit(JobLoaded(jobList: value.data ?? []));
      });
    });
  }
}



import 'package:employme/data/models/respone/job_response_model.dart';
import 'package:flutter/material.dart';

@immutable
abstract class JobState {}

class JobInitial extends JobState {}

class JobLoading extends JobState {}

class JobLoaded extends JobState {
  final List<Job> jobList ;

  JobLoaded({required this.jobList});
}

class JobError extends JobState {
  final String error;

  JobError({required this.error});
}

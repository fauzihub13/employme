part of 'job_bloc.dart';

@immutable
abstract class JobEvent {}

class GetJobList extends JobEvent{
  GetJobList();
}

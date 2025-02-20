import 'package:employme/core/constants/colors.dart';
import 'package:flutter/material.dart';

enum JobStatus {
  open,
  closed,
  applied,
}

Color getJobStatusBackgroundColor(JobStatus status) {
  switch (status) {
    case JobStatus.open:
      return AppColors.lightGreen;
    case JobStatus.closed:
      return AppColors.lightRed;
    case JobStatus.applied:
      return AppColors.lightBlue;
  }
}

Color getJobStatusTextColor(JobStatus status) {
  switch (status) {
    case JobStatus.open:
      return AppColors.darkGreen;
    case JobStatus.closed:
      return AppColors.darkRed;
    case JobStatus.applied:
      return AppColors.darkBlue;
  }
}

String getJobStatusLabel(JobStatus status) {
  switch (status) {
    case JobStatus.open:
      return "Open";
    case JobStatus.closed:
      return "Closed";
    case JobStatus.applied:
      return "Applied";
  }
}

JobStatus parseJobStatus(String status) {
  return JobStatus.values.firstWhere(
    (e) => e.toString().split('.').last.toLowerCase() == status.toLowerCase(),
    orElse: () => JobStatus.open, // Default jika tidak ditemukan
  );
}

import 'package:employme/core/constants/colors.dart';
import 'package:flutter/material.dart';

enum JobStatus {
  open,
  closed,
  applied,
  cancelled,
  reviewing,
  delivered
}

Color getJobStatusBackgroundColor(JobStatus status) {
  switch (status) {
    case JobStatus.open || JobStatus.reviewing:
      return AppColors.lightGreen;
    case JobStatus.closed || JobStatus.cancelled:
      return AppColors.lightRed;
    case JobStatus.applied || JobStatus.delivered:
      return AppColors.lightBlue;
 
  }
}

Color getJobStatusTextColor(JobStatus status) {
  switch (status) {
    case JobStatus.open || JobStatus.reviewing:
      return AppColors.darkGreen;
    case JobStatus.closed || JobStatus.cancelled:
      return AppColors.darkRed;
    case JobStatus.applied || JobStatus.delivered:
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
    case JobStatus.reviewing:
      return "Reviewing";
    case JobStatus.cancelled:
      return "Cancelled";
    case JobStatus.delivered:
      return "Delivered";
  }
}

JobStatus parseJobStatus(String status) {
  return JobStatus.values.firstWhere(
    (e) => e.toString().split('.').last.toLowerCase() == status.toLowerCase(),
    orElse: () => JobStatus.open,
  );
}

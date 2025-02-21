import 'package:dartz/dartz.dart';
import 'package:employme/core/constants/variabeles.dart';
import 'package:employme/data/models/respone/job_response_model.dart';
import 'package:http/http.dart' as http;

class JobRemoteDatasources {
  Future<Either<String, JobResponseModel>> getJobList() async {
    final url = Uri.parse('${Variables.baseUrl}/api/jobs');
    final response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    // print(response.body);

    if (response.statusCode == 200) {
      return Right(JobResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get jobs');
    }
  }
}

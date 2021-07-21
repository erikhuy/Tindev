
import 'package:http/http.dart' as http;
import '../models/JobType.dart';

class JobTypeServices {

  static Future<List<JobTypeElement>> getJobType() async {
    try {
      var url = Uri.parse('https://tindev-api-team-chicken.herokuapp.com/api/v1/job-types');
      final response = await http.get(url);
      if (200 == response.statusCode) {
        final List<JobTypeElement> jobTypes = jobTypeFromJson(response.body).jobTypes;
        return jobTypes;
      } else {
        // ignore: deprecated_member_use
        return List<JobTypeElement>();
      }
    } catch (error) {
      // ignore: deprecated_member_use
      return List<JobTypeElement>();
    }
  }
}
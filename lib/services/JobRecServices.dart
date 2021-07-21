import 'package:http/http.dart' as http;
import 'package:tindev/models/JobList.dart';

class JobRecServices {
  // ignore: missing_return
  static Future<List<JobRec>> getListJobRecOfCom(String token) async {
    try {
      var url = Uri.parse(
          "https://tindev-api-team-chicken.herokuapp.com/api/v1/job-recruitments");
      var response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer ' + token,
        },
      );
      if (200 == response.statusCode) {
        final List<JobRec> listJobRec = jobListFromJson(response.body).jobRecruitments;
        return listJobRec;
      } else {
        print("Code: " + response.statusCode.toString() + "\n");
        print("Body: " + response.body + "\n");
      }
    } catch (error) {
      print(error.toString());
    }
  }

  // ignore: missing_return
  static Future<List<JobRec>> getListJobRecForDev(String token) async {
    try {
      var url = Uri.parse(
          "https://tindev-api-team-chicken.herokuapp.com/api/v1/job-recruitments/random");
      var response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer ' + token,
        },
      );
      if (200 == response.statusCode) {
        final List<JobRec> listJobRec = jobListFromJson(response.body).jobRecruitments;
        return listJobRec;
      } else {
        print("Code: " + response.statusCode.toString() + "\n");
        print("Body: " + response.body + "\n");
      }
    } catch (error) {
      print(error.toString());
    }
  }
}

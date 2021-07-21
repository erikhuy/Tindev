import 'package:http/http.dart' as http;
import 'package:tindev/models/Education.dart';

class EducationServices {
  // ignore: missing_return
  static Future<List<EducationElement>> getListEdu(String userID) async {
    try {
      // ignore: unnecessary_brace_in_string_interps
      var url = Uri.parse(
          // ignore: unnecessary_brace_in_string_interps
          "https://tindev-api-team-chicken.herokuapp.com/api/v1/educations/user-id=${userID}");
      var response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          // 'Authorization': 'Bearer ' + widget.token,
        },
      );
      if (200 == response.statusCode) {
        final List<EducationElement> listEdu = educationFromJson(response.body).educations;
        return listEdu;
      } else {
        print("Code: " + response.statusCode.toString() + "\n");
        print("Body: " + response.body + "\n");
        // ignore: deprecated_member_use
        return List<EducationElement>();
      }
    } catch (error) {
      print(error.toString());
    }
  }
}

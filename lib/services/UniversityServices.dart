import 'package:tindev/models/University.dart';
import 'package:http/http.dart' as http;

class UniversityServies {
  static Future<List<UniversityElement>> getListUniversity(String token) async {
    try {
      var url = Uri.parse(
          "https://tindev-api-team-chicken.herokuapp.com/api/v1/universities");
      var response = await http.get(
        url,
        // headers: {
        //   'Authorization': 'Bearer ' + token,
        // },
      );
      if (200 == response.statusCode) {
        final List<UniversityElement> uni = universityFromJson(response.body).universities;
        return uni;
      } else {
        print("Code: " + response.statusCode.toString() + "\n");
        print("Body: " + response.body + "\n");
        // ignore: deprecated_member_use
        return List<UniversityElement>();
      }
    } catch (error) {
      print(error.toString());
    }
  }
}

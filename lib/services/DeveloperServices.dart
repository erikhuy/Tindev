import 'package:http/http.dart' as http;
import 'package:tindev/models/DevAcc.dart';

class DeveloperServices {
  // ignore: missing_return
  static Future<DeveloperClass> getDeveloperInfo(String token) async {
    try {
      // ignore: unnecessary_brace_in_string_interps
      var url = Uri.parse(
          "https://tindev-api-team-chicken.herokuapp.com/api/v1/developers/my-info");
      var response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer ' + token,
        },
      );
      if (response.statusCode == 200) {
        final DeveloperClass dev = developerFromJson(response.body).developer;
        return dev;
      } else {
        print("Code: " + response.statusCode.toString() + "\n");
        print("Body: " + response.body + "\n");
      }
    } catch (error) {
      print(error.toString());
    }
  }
}

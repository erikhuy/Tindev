import 'package:tindev/models/DevList.dart';
import 'package:http/http.dart' as http;

class DevsServices {
  // ignore: missing_return
  static Future<List<Developer>> getListDevs(String token) async {
    try {
      var url = Uri.parse(
          "https://tindev-api-team-chicken.herokuapp.com/api/v1/developers");
      var response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer ' + token,
        },
      );
      if (200 == response.statusCode) {
        final List<Developer> listDevs =
            devListFromJson(response.body).developers;
        return listDevs;
      } else {
        print("Code: " + response.statusCode.toString() + "\n");
        print("Body: " + response.body + "\n");
      }
    } catch (error) {
      print(error.toString());
    }
  }
}

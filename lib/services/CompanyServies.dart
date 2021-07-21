import 'package:tindev/models/ComAcc.dart';
import 'package:http/http.dart' as http;

class CompanyServices {
  // ignore: missing_return
  static Future<CompanyClass> getCompanyInfo(String token) async {
    try {
      // ignore: unnecessary_brace_in_string_interps
      var url = Uri.parse(
          "https://tindev-api-team-chicken.herokuapp.com/api/v1/companies/my-info");
      var response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer ' + token,
        },
      );
      if (200 == response.statusCode) {
        final CompanyClass com = companyFromJson(response.body).company;
        return com;
      } else {
        print("Code: " + response.statusCode.toString() + "\n");
        print("Body: " + response.body + "\n");
      }
    } catch (error) {
      print(error.toString());
    }
  }

  // ignore: missing_return
  static Future<CompanyClass> getCompanyInfoByID(String userID) async {
    try {
      var url = Uri.parse(
          // ignore: unnecessary_brace_in_string_interps
          "https://tindev-api-team-chicken.herokuapp.com/api/v1/companies/user-id=${userID}");
      var response = await http.get(
        url,
        headers: {},
      );
      if (200 == response.statusCode) {
        final CompanyClass com = companyFromJson(response.body).company;
        return com;
      } else {
        print("Code: " + response.statusCode.toString() + "\n");
        print("Body: " + response.body + "\n");
      }
    } catch (error) {
      print(error.toString());
    }
  }
}

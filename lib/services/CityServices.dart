import 'package:http/http.dart' as http;
import '../models/City.dart';

class CityServices {
  static Future<List<CityElement>> getCities() async {
    try {
      var url = Uri.parse('https://tindev-api-team-chicken.herokuapp.com/api/v1/cities');
      final response = await http.get(url);
      if (200 == response.statusCode) {
        final List<CityElement> cities = cityFromJson(response.body).cities;
        return cities;
      } else {
        // ignore: deprecated_member_use
        return List<CityElement>();
      }
    } catch (error) {
      // ignore: deprecated_member_use
      return List<CityElement>();
    }
  }
}

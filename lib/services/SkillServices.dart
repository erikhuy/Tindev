
import 'package:http/http.dart' as http;
import '../models/Skill.dart';

class SkillServices {

  static Future<List<SkillElement>> getSkills() async {
    try {
      var url = Uri.parse('https://tindev-api-team-chicken.herokuapp.com/api/v1/skills');
      final response = await http.get(url);
      if (200 == response.statusCode) {
        final List<SkillElement> skills = skillFromJson(response.body).skills;
        return skills;
      } else {
        // ignore: deprecated_member_use
        return List<SkillElement>();
      }
    } catch (error) {
      // ignore: deprecated_member_use
      return List<SkillElement>();
    }
  }
}
import 'package:faker/faker.dart';

class TagsData {
  static final faker = Faker();

  static final List<String> tags =
      List.generate(20, (index) => faker.address.continent());

  static List<String> getSuggestions(String query) =>
      List.of(tags).where((tag) {
        final cityLower = tag.toLowerCase();
        final queryLower = query.toLowerCase();

        return cityLower.contains(queryLower);
      }).toList();
}

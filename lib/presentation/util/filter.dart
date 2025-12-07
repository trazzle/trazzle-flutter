// 필터 함수
class Filters {
  List<String> filterCountries(List<String> list, String query) {
    return list
        .where((country) => country.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
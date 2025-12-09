// 필터 함수
class Filters {
  // 나라 검색
  List<String> filterCountries(List<String> list, String query) {
    return list
        .where((country) => country.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  // 도시 검색
  List<String> filterCities(List<String> list, String query) {
    return list
        .where((cities) => cities.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
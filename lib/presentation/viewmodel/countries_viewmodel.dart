import 'package:flutter/cupertino.dart';
import 'package:trazzle/domain/country.dart';
import 'package:flutter_svg/flutter_svg.dart';

// svg 파싱하여 Path 추출
Future<List<Country>> parseCountries(BuildContext context, String assetPath) async {
  final svgString = await DefaultAssetBundle.of(context).loadString(assetPath);

  final DrawableRoot svgRoot = await svg.fromSvgString(svgString, svgString);

  final List<Country> countries = [];

  void extract(Drawable drawable) {
    if (drawable is DrawableShape) {
      print("CountriesViewModel: ${drawable.path.getBounds()}");

      final path = drawable.path;
      final id = drawable.id ?? "unknown";

      countries.add(
        Country(id: id, path: path),
      );
    }

    if (drawable is DrawableGroup) {
      for (final child in drawable.children!) {
        extract(child);
      }
    }

    if (drawable is DrawableParent) {
      print("countriesViewModel: $drawable");
      for (final child in drawable.children!) {
        extract(child);
      }
    }
  }
  
  extract(svgRoot);

  return countries;
}
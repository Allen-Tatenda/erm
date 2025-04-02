import 'dart:math';

class PolygonsUtils {
  static bool isInside(List<Point<double>> polygonPoints, Point<double> point) {
    if (polygonPoints.isEmpty) return false;
    List<List<double>> polygon = [];

    for (Point<double> polygonPoint in polygonPoints) {
      polygon.add([polygonPoint.x, polygonPoint.y]);
    }

    polygon.add(polygon.first);
    var n = polygon.length;

    var count = 0;

    var x = point.x;
    var y = point.y;

    for (var i = 0; i < n - 1; ++i) {
      var side = {
        "a": {
          "x": polygon[i][0],
          "y": polygon[i][1],
        },
        "b": {
          "x": polygon[i + 1][0],
          "y": polygon[i + 1][1],
        },
      };

      var x1 = side["a"]!["x"];
      var x2 = side["b"]!["x"];
      var y1 = side["a"]!["y"];
      var y2 = side["b"]!["y"];

      if (y < y1! != y < y2! && x < (x2! - x1!) * (y - y1) / (y2 - y1) + x1) {
        count += 1;
      }
    }

    return count % 2 == 0 ? false : true;
  }
}

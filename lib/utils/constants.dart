import 'package:flutter/material.dart';

class Constants {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static dynamic languages = [
    {
      "urlParam": "c",
      "name": "C"
    },
    {
      "urlParam": "c%23",
      "name": "C#"
    },
    {
      "urlParam": "c%2B%2B",
      "name": "C++"
    },
    {
      "urlParam": "dart",
      "name": "Dart"
    },
    {
      "urlParam": "go",
      "name": "Go"
    },
    {
      "urlParam": "java",
      "name": "Java"
    },
    {
      "urlParam": "javascript",
      "name": "JavaScript"
    },
    {
      "urlParam": "kotlin",
      "name": "Kotlin"
    },
    {
      "urlParam": "objective-c",
      "name": "Objective-C"
    },
    {
      "urlParam": "python",
      "name": "Python"
    },
    {
      "urlParam": "sql",
      "name": "SQL"
    },
    {
      "urlParam": "swift",
      "name": "Swift"
    },
  ];
}
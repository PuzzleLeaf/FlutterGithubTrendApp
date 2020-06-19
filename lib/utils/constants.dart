import 'package:flutter/material.dart';
import 'package:gitboard/models/repository_language_model.dart';
import 'package:gitboard/models/repository_query_model.dart';

class Constants {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static String sinceToString(Since since) {
    return since.toString().split('.').last;
  }

  static List<RepositoryLanguageModel> languages = [
    RepositoryLanguageModel.fromJson(
      {
        "urlParam": "",
        "name": "All",
        "color": "#000000",
      },
    ),
    RepositoryLanguageModel.fromJson(
      {
        "urlParam": "c",
        "name": "C",
        "color": "#555555",
      },
    ),
    RepositoryLanguageModel.fromJson(
      {
        "urlParam": "c%23",
        "name": "C#",
        "color": "#178600",
      },
    ),
    RepositoryLanguageModel.fromJson(
      {
        "urlParam": "c%2B%2B",
        "name": "C++",
        "color": "#f34b7d",
      },
    ),
    RepositoryLanguageModel.fromJson(
      {"urlParam": "dart", "name": "Dart", "color": "#00B4AB"},
    ),
    RepositoryLanguageModel.fromJson(
      {
        "urlParam": "go",
        "name": "Go",
        "color": "#00ADD8",
      },
    ),
    RepositoryLanguageModel.fromJson(
      {
        "urlParam": "java",
        "name": "Java",
        "color": "#b07219",
      },
    ),
    RepositoryLanguageModel.fromJson(
      {
        "urlParam": "javascript",
        "name": "JavaScript",
        "color": "#f1e05a",
      },
    ),
    RepositoryLanguageModel.fromJson(
      {
        "urlParam": "kotlin",
        "name": "Kotlin",
        "color": "#f18e33",
      },
    ),
    RepositoryLanguageModel.fromJson(
      {
        "urlParam": "objective-c",
        "name": "Objective-C",
        "color": "#438eff",
      },
    ),
    RepositoryLanguageModel.fromJson(
      {
        "urlParam": "python",
        "name": "Python",
        "color": "#3572A5",
      },
    ),
    RepositoryLanguageModel.fromJson(
      {
        "urlParam": "swift",
        "name": "Swift",
        "color": "#ffac45",
      },
    ),
  ];
}

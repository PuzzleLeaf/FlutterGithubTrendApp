

import 'package:dio/dio.dart';
import 'package:gitboard/models/repository_model.dart';

class GitTrendApiProvider {
  Dio dio = Dio();

  Future<List<RepositoryModel>> fetchTrendingRepositories(String language, String since, String spokenLanguageCode) async {
    var url = 'https://ghapi.huchen.dev/repositories?language=${language}&since=${since}&spoken_language_code=${spokenLanguageCode}';
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      Iterable list = response.data;
      return list.map((json) => RepositoryModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load get');
    }
  }
}
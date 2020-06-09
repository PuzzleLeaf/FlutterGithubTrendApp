import 'package:dio/dio.dart';
import 'package:gitboard/models/repository_model.dart';

class GitService {
  Future<List<RepositoryModel>> fetchTrendRepositories() async {
    var url = 'https://ghapi.huchen.dev/repositories';

    var response = await Dio().get(url);

    if (response.statusCode == 200) {
      Iterable list = response.data;
      return list.map((e) => RepositoryModel.fromJson(e)).toList();
    } else {
      throw Exception("Error");
    }
  }
}
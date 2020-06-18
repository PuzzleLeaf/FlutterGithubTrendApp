import 'package:flutter/material.dart';
import 'package:gitboard/models/repository_model.dart';

class RepositoryDetailScreen extends StatelessWidget {
  final RepositoryModel data;

  const RepositoryDetailScreen({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff6f7fa),
      appBar: AppBar(),
      body: Container(),
    );
  }
}

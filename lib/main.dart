import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app.dart';
import 'helpers/api/api.dart';
import 'models/fact/fact.dart';

void main() async {
  final dio = Dio();
  final client = RestClient(dio);
  await Hive.initFlutter();
  Hive.registerAdapter(FactAdapter());
  runApp(MyApp(client: client, key: GlobalKey()));
}

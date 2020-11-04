import 'package:flutter/material.dart';

import 'package:movies_app/depen_injec/get_it.dart' as getIt;
import 'package:movies_app/domain/entities/no_params.dart';
import 'package:movies_app/domain/usecases/get_trending.dart';
import 'package:pedantic/pedantic.dart';

void main() async {
  unawaited(getIt.initGetIt());
  final eitherResponse = await getIt.getIt<GetTrending>().call(NoParams());
  eitherResponse.fold(
    (l) => print('error'),
    (r) => print('success'),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(),
    );
  }
}

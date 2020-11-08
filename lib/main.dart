import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_size/responsive_size.dart';
import 'package:pedantic/pedantic.dart';

import 'package:movies_app/presentation/movies_app.dart';
import 'package:movies_app/depen_injec/get_it.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]));
  unawaited(AppGetIt.init());
  ResponsiveSize.init(designWidth: 414, designHeight: 896);
  runApp(MoviesApp());
}

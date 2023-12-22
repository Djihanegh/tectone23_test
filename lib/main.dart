import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:loggy/loggy.dart';
import 'package:tectone23_test/core/index.dart';

import 'firebase_options.dart';

void main() async {
  await _init();
  runApp(const TectoneApp());
}

Future<void> _init() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await _initFirebase();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  _initLoggy();
}

void _initLoggy() {
  Loggy.initLoggy(
    logOptions: const LogOptions(
      LogLevel.all,
      stackTraceLevel: LogLevel.warning,
    ),
    logPrinter: const PrettyPrinter(),
  );
}

Future<void> _initFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

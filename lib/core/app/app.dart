
import '../index.dart';
import 'di.dart';

class TectoneApp extends StatelessWidget {
  const TectoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const DI(child: _App());
  }
}

class _App extends StatefulWidget {
  const _App();

  @override
  State<_App> createState() => _AppState();
}

class _AppState extends State<_App> {
  late GoRouter _router;

  @override
  void initState() {
    _router = getRouter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return KeyboardVisibilityProvider(
      child: MaterialApp.router(
        onGenerateTitle: (context) => context.l10n.appName,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        routerConfig: _router,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}

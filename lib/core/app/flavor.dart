// To run the app in development flavor, run the following command:
// flutter run --dart-define-from-file=dev.json
class Flavor {
  factory Flavor() => _instance ??= const Flavor._(
        // ignore: do_not_use_environment
        name: String.fromEnvironment('name', defaultValue: 'production'),
      );

  const Flavor._({
    required this.name,
  });

  static Flavor? _instance;

  final String name;
}

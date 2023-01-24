enum BuildFlavor { production, development }

class BuildEnvironment {
  final BuildFlavor flavor;

  static BuildEnvironment? _instance;

  BuildEnvironment({
    required this.flavor,
  });

  static BuildEnvironment getInstance({
    baseUrl,
    flavor,
  }) {
    if (_instance == null) {
      _instance = BuildEnvironment(
        flavor: flavor,
      );
      return _instance!;
    }
    return _instance!;
  }
}

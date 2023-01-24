import 'package:kanban/build_environment.dart';
import 'package:kanban/main.dart';

void main() {
  BuildEnvironment.getInstance(
    flavor: BuildFlavor.production,
  );

  mainCommon();
}

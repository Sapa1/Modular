import 'package:aprendendo_modular/app/modules/home_module/home_module.dart';
import 'package:aprendendo_modular/app/modules/submission_module/submission_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: HomeModule()),
        ModuleRoute('/second_screen', module: SubmissionModule()),
      ];
}

import 'package:aprendendo_modular/app/modules/submission_module/bloc/second_bloc.dart';
import 'package:aprendendo_modular/app/modules/submission_module/pages/second_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SubmissionModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<SecondBloc>((i) => SecondBloc()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const SecondScreen()),
      ];
}

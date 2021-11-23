import 'package:aprendendo_modular/app/bloc/temp_home_bloc.dart';
import 'package:aprendendo_modular/app/modules/submission/second_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<TempHomeBloc>((i) => TempHomeBloc()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
        ChildRoute('/second_screen',
            child: (context, args) => const SecondScreen()),
      ];
}

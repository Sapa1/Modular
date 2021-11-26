import 'package:aprendendo_modular/app/modules/home_module/bloc/temp_home_bloc.dart';
import 'package:aprendendo_modular/app/modules/home_module/pages/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<TempHomeBloc>((i) => TempHomeBloc()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
      ];
}

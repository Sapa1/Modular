import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import '../bloc/temp_event_bloc.dart';
import '../bloc/temp_home_bloc.dart';
import '../bloc/temp_state_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    TempFetchApiEvent tempFetchApiEvent = TempFetchApiEvent();
    Modular.get<TempHomeBloc>().add(tempFetchApiEvent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Primeira página'),
      ),
      body: BlocBuilder<TempHomeBloc, TempState>(
        bloc: Modular.get<TempHomeBloc>(),
        builder: (context, state) {
          if (state is TempStateSuccess) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.temperatura.city),
                  Text('${state.temperatura.temp}ºC'),
                  Text(DateFormat('dd/MM/yyyy').format(state.temperatura.date)),
                ],
              ),
            );
          }
          if (state is TempStateFailure) {
            return Center(
              child: Text(state.message),
            );
          }
          if (state is TempStateLoading) {
            return const Center(
              child: Text('Carregando...'),
            );
          }
          if (state is TempStateEmpty) {
            return const Center(
              child: Text('Não há dados'),
            );
          }
          return const Center(
            child: Text('Deu ruim'),
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 28.0, left: 80, right: 80),
        child: ElevatedButton(
          onPressed: () => Modular.to.pushNamed('/second_screen'),
          child: const Text('Ir para a segunda página'),
        ),
      ),
    );
  }
}

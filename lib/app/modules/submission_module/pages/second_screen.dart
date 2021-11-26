import 'package:aprendendo_modular/app/modules/submission_module/bloc/second_bloc.dart';
import 'package:aprendendo_modular/app/modules/submission_module/bloc/second_event_bloc.dart';
import 'package:aprendendo_modular/app/modules/submission_module/bloc/second_state_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends ModularState<SecondScreen, SecondBloc> {
  @override
  void initState() {
    Modular.get<SecondBloc>().add(SecondFetchListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int countItem = 2;
    int _selectedIndex = 1;
    void _onItemTapped(int index) {
      if (index == 0) {
        bloc.add(SecondRemoveItemEvent(itemRemove: 'Item ${--countItem}'));
      }
      if (index == 1) {
        Modular.to.pop();
      }
      if (index == 2) {
        bloc.add(SecondAddItemEvent(item: 'Item ${countItem++}'));
      }
      _selectedIndex = index;
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Segunda tela')),
      body: BlocBuilder<SecondBloc, SecondState>(
        bloc: Modular.get<SecondBloc>(),
        builder: (context, state) {
          if (state is SecondSucessState) {
            return Stack(
              children: [
                ListView.builder(
                  itemCount: state.list.length,
                  itemBuilder: (context, index) {
                    String item = state.list[index];
                    return ListTile(
                      title: Center(
                        child: Text(item),
                      ),
                    );
                  },
                ),
              ],
            );
          } else if (state is SecondLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SecondErrorState) {
            return const Center(
              child: Text('Erro ao carregar lista'),
            );
          } else if (state is SecondEmptyListState) {
            return const Center(
              child: Text('Lista vazia'),
            );
          }
          return const Center(
            child: Text('deu ruim'),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.remove),
            label: 'Remove',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Return',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

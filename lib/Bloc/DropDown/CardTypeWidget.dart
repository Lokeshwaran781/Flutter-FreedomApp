import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freedom_app/Bloc/DropDown/Bloc.dart';
import 'event.dart';
import 'state.dart';

class Cardtypewidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DropdownBloc()..add(LoadDropdownItems()),
      child: BlocBuilder<DropdownBloc, DropdownState>(
        builder: (context, state) {
          if (state.items.isEmpty) {
            return CircularProgressIndicator();
          }
          final validSelectedItem = state.items.contains(state.selectedItem) ? state.selectedItem : null;
          return DropdownButton<String>(
            value: validSelectedItem,
            hint: const Text('Select an item'),
            items: state.items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                BlocProvider.of<DropdownBloc>(context).add(SelectDropdownItem(value));
              }
            },
          );
        },
      ),
    );
  }
}

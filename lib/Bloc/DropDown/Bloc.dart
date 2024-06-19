import 'package:flutter_bloc/flutter_bloc.dart';
import 'event.dart';
import 'state.dart';

class DropdownBloc extends Bloc<DropdownEvent, DropdownState> {
  DropdownBloc() : super(const DropdownState()) {
    on<LoadDropdownItems>(_onLoadDropdownItems);
    on<SelectDropdownItem>(_onSelectDropdownItem);
  }

  void _onLoadDropdownItems(LoadDropdownItems event, Emitter<DropdownState> emit) {
    final items = ['Visa', 'Master Card', 'Rupay'];
    emit(state.copyWith(items: items, selectedItem: items.isNotEmpty ? items[0] : null));
  }

  void _onSelectDropdownItem(SelectDropdownItem event, Emitter<DropdownState> emit) {
    emit(state.copyWith(selectedItem: event.selectedItem));
  }
}

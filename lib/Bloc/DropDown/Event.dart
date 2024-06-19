import 'package:equatable/equatable.dart';

abstract class DropdownEvent extends Equatable {
  const DropdownEvent();

  @override
  List<Object> get props => [];
}

class LoadDropdownItems extends DropdownEvent {}

class SelectDropdownItem extends DropdownEvent {
  final String selectedItem;

  const SelectDropdownItem(this.selectedItem);

  @override
  List<Object> get props => [selectedItem];
}

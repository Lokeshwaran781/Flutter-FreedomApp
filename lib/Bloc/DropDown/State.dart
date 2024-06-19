import 'package:equatable/equatable.dart';

class DropdownState extends Equatable {
  final List<String> items;
  final String selectedItem;

  const DropdownState({this.items = const [], this.selectedItem = ''});

  DropdownState copyWith({List<String>? items, String? selectedItem}) {
    return DropdownState(
      items: items ?? this.items,
      selectedItem: selectedItem ?? this.selectedItem,
    );
  }

  @override
  List<Object> get props => [items, selectedItem];
}

import 'package:equatable/equatable.dart';

class RememberMeState extends Equatable{
  final bool Remember;

  const RememberMeState(this.Remember);

  @override
  List<Object> get props=>[Remember];
}


import 'package:equatable/equatable.dart';
import 'package:freedom_app/models/ProductCartModel.dart';

abstract class CartState extends Equatable {
  const CartState();
}

class CartInitial extends CartState {
  @override
  List<Object> get props => [];
}

class CartLoaded extends CartState {
  final List<ProductCartModel> cart;
  final double totalPrice;

  CartLoaded({required this.cart, required this.totalPrice});

  @override
  List<Object> get props => [cart, totalPrice];
}

class CartError extends CartState {
  final String message;

  CartError({required this.message});

  @override
  List<Object> get props => [message];
}
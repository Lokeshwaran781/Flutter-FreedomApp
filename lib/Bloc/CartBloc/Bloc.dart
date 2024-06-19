import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freedom_app/Bloc/CartBloc/Event.dart';
import 'package:freedom_app/Bloc/CartBloc/State.dart';
import 'package:freedom_app/api/GetCart.dart';
import 'package:freedom_app/models/ProductCartModel.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<LoadCart>(_onLoadCart);
  }
  List<ProductCartModel> cartItems = [];

  Future<void> getCartItems() async{
    cartItems = await getCart();
  }

  void _onLoadCart(LoadCart event, Emitter<CartState> emit) {
    try {
      getCartItems();
      List<ProductCartModel> cart = cartItems; 
      final totalPrice = 0.0;
      emit(CartLoaded(cart: cart, totalPrice: totalPrice));
    } catch (e) {
      emit(CartError(message: e.toString()));
    }
  }
}
import 'package:flutter/material.dart';

abstract class CartState {
  final List<int> cartItem;
  const CartState({required this.cartItem});

  List<Object> get props => [];
}

class CartLoadInProgress extends CartState {
  CartLoadInProgress() : super(cartItem: []);
}

class ProductAdded extends CartState {
  @override
  // ignore: overridden_fields
  final List<int> cartItem;

  const ProductAdded({required this.cartItem}) : super(cartItem: cartItem);

  @override
  List<Object> get props => [cartItem];

  @override
  String toString() => 'ProductAdded { todos: $cartItem }';
}

class ProductRemoved extends CartState {
  @override
  // ignore: overridden_fields
  final List<int> cartItem;

  const ProductRemoved({required this.cartItem}) : super(cartItem: cartItem);

  @override
  List<Object> get props => [cartItem];

  @override
  String toString() => 'ProductRemoved { todos: $cartItem }';
}
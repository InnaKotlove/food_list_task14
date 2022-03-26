import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_list_task14/cart_BloC/cart_bloc.dart';
import 'package:food_list_task14/cart_BloC/cart_state.dart';
import 'package:food_list_task14/representation/product_title.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(listener: (context, state) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              state is ProductAdded ? 'Added to cart' : 'Removed from cart'),
          duration: const Duration(seconds: 1),
        ),
      );
    }, builder: (_, cartState) {
      List<int> cart = cartState.cartItem;
      return LayoutBuilder(builder: (context, constraints) {
        return GridView.builder(
          itemCount: 100,
          itemBuilder: (context, index) => ProductTile(
            itemNo: index,
            cart: cart,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: constraints.maxWidth > 700 ? 4 : 1,
            childAspectRatio: 5,
          ),
        );
      });
    });
  }
}
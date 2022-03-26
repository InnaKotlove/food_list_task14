import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_list_task14/cart_BloC/cart_bloc.dart';
import 'package:food_list_task14/cart_BloC/cart_event.dart';

class ProductTile extends StatelessWidget {
  final int itemNo;
  final List<int> cart;

  // ignore: use_key_in_widget_constructors
  const ProductTile({required this.itemNo, required this.cart});

  @override
  Widget build(BuildContext context) {
    final Color color = Colors.primaries[itemNo % Colors.primaries.length];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: () {},
        // ignore: sized_box_for_whitespace
        leading: Container(
          width: 50,
          height: 30,
          child: Placeholder(
            color: color,
          ),
        ),
        title: Text(
          'Product $itemNo',
          key: Key('text_$itemNo'),
        ),
        trailing: IconButton(
          key: Key('icon_$itemNo'),
          icon: cart.contains(itemNo)
              ? const Icon(Icons.shopping_cart)
              : const Icon(Icons.shopping_cart_outlined),
          onPressed: () {
            !cart.contains(itemNo)
                ? BlocProvider.of<CartBloc>(context).add(AddProduct(itemNo))
                : BlocProvider.of<CartBloc>(context).add(RemoveProduct(itemNo));
          },
        ),
      ),
    );
  }
}
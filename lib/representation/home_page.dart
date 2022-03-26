import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_list_task14/cart_BloC/cart_bloc.dart';
import 'package:food_list_task14/cart_BloC/cart_state.dart';
import 'package:food_list_task14/representation/product_list.dart';

class HomePage extends StatefulWidget {
  static String routeName = '/';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartBloc>(
        create: (_) => CartBloc(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Shopping list'),
            actions: <Widget>[
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: TextButton.icon(
                      style: TextButton.styleFrom(primary: Colors.white),
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_cart),
                      label: const Text(''),
                      key: const Key('cart'),
                    ),
                  ),
                  BlocBuilder<CartBloc, CartState>(builder: (_, cartState) {
                    List<int> cartItem = cartState.cartItem;
                    return Positioned(
                      left: 30,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.red),
                        child: Text(
                          '${cartItem.length}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ],
          ),
          body: ProductList(),
        ));
  }
}
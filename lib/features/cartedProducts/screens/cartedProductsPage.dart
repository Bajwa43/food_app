import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_panda_clone/features/cartedProducts/bloc/bloc/carted_bloc.dart';
import 'package:food_panda_clone/features/cartedProducts/screens/catedWidget.dart';
import 'package:food_panda_clone/features/dashBoard/model/cart_product_model.dart';

class CartedProductPage extends StatefulWidget {
  const CartedProductPage({super.key});

  static const String pageName = '/CartedProductPage';

  @override
  State<CartedProductPage> createState() => _CartedProductPageState();
}

class _CartedProductPageState extends State<CartedProductPage> {
  @override
  void initState() {
    super.initState();
    context.read<CartedBloc>().add(CartedInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Carted Page')),
      body: BlocBuilder<CartedBloc, CartedState>(
        // bloc: context.read<>(),
        builder: (context, state) {
          if (state is CartedLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CartedErrorState) {
            return Center(child: Text(state.errorMessage));
          } else if (state is CartedLoadedState) {
            List<CartedProductsModel> list = state.listOfCartedModel;
            return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) => CartedContainer(
                    idOfDoc: list[index].id,
                    quantity: list[index].noOfItems.toInt(),
                    imagUrl: list[index].imageUrl,
                    itemName: list[index].itemName,
                    itemPrice: list[index].itemPrice.toInt()));
          } else {
            return Container(color: Colors.amber);
          }
        },
      ),
    );
  }
}

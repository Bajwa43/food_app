import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_panda_clone/Utility/helpers/helping_function.dart';
import 'package:food_panda_clone/features/cartedProducts/bloc/bloc/carted_bloc.dart';

class CartedContainer extends StatelessWidget {
  const CartedContainer(
      {super.key,
      this.idOfDoc,
      required this.quantity,
      required this.imagUrl,
      required this.itemName,
      required this.itemPrice});

  final String? idOfDoc;
  final int quantity;
  final String imagUrl;
  final String itemName;
  final int itemPrice;

  @override
  Widget build(BuildContext context) {
    double width = THelpingFunction.screenWidth(context: context);
    double height = THelpingFunction.screenHeight(context: context);
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: height * 0.01, horizontal: width * 0.015),
      child: Stack(children: [
        Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(width * 0.02),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.white38,
                      offset: Offset(-1, -1),
                      spreadRadius: 1,
                      blurRadius: 2),
                  BoxShadow(
                      color: Colors.black38,
                      offset: Offset(1, 1),
                      spreadRadius: 1,
                      blurRadius: 2)
                ]),
            child: Row(
              children: [
                // .
                Expanded(
                    flex: 2,
                    child: Center(
                        child: Container(
                            // padding: EdgeInsets.symmetric(horizontal: 1),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: width * 0.005, color: Colors.grey)),
                            child: TextButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.arrow_drop_down),
                                label: Text(quantity.toString()))))),
                // ..
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    // padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Container(
                        height: height * 0.15,
                        // decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(50)),
                        child: Image(
                          image: NetworkImage(imagUrl),
                          fit: BoxFit.fill,
                        )),
                  ),
                ),
                // ...
                Expanded(flex: 3, child: Text(itemName)),
                // ....
                Expanded(
                    flex: 2, child: FittedBox(child: Text('Rs.$itemPrice.00')))
              ],
            )),
        // Spacer(),
        Padding(
          padding: EdgeInsets.only(top: height * 0.1),
          child: Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                  onPressed: () {
                    context
                        .read<CartedBloc>()
                        .add(CartedProductDeletedEvent(idOfDoc: idOfDoc!));
                  },
                  icon: Icon(Icons.delete))),
        )
      ]),
    );
  }
}

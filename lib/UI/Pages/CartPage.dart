import 'package:flutter/material.dart';
import 'package:signup/BLoC/cubit/item_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signup/Data/Models/ItemX_Model.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemCubit, ItemState>(
      builder: (context, state) {
        List<ItemX> items = state.itemX;
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text("Cart"),
          ),
          body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return items.isEmpty
                  ? Center(child: Text("Please Add items",style: TextStyle(fontSize: 24.0),))
                  : ListTile(
                      title: Text(items[index].title.toString()),
                      subtitle: Text(items[index].price.toString()),
                      trailing: IconButton(
                          onPressed: () {
                            BlocProvider.of<ItemCubit>(context)
                                .removeItemX(items[index]);
                          },
                          icon: Icon(Icons.remove)),
                    );
            },
          ),
        );
      },
    );
  }
}

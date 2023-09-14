import 'package:flutter/material.dart';
import 'package:shopping_list/Data/dummy_items.dart';
import 'package:shopping_list/widgets/new_list_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});
  @override
  State<GroceryList> createState() {
    return _GroceryList();
  }
}
class _GroceryList extends State<GroceryList>{
  void _addItem(){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx)=>const NewListItem())
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GROCERIES"),
        actions: [
          IconButton(onPressed: _addItem, icon: Icon(Icons.add))
        ],),

      body: ListView.builder(
          itemCount: groceryItems.length,
          itemBuilder: (ctx, index) => ListTile(
            title: Text(
              groceryItems[index].name,
              style: const TextStyle(fontSize: 25),
            ),
            leading: Container(
              height: 24,
              width: 24,
              color: groceryItems[index].category.color,
            ),
            trailing: Text(
              groceryItems[index].quantity.toString(),
              style: const TextStyle(fontSize: 23),
            ),
          )),
    );
  }

}

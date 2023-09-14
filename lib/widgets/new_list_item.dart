import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/Data/categories.dart';

class NewListItem extends StatefulWidget {
  const NewListItem({super.key});

  @override
  State<NewListItem> createState() {
    return _NewListItem();
  }
}

class _NewListItem extends State<NewListItem> {
  final _formKey=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GROCERIES"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(label: Text("Name")),
                validator: (value) {
                  if (value == null ||
                      value.isNotEmpty ||
                      value.trim().length <= 1 ||
                      value.trim().length > 50 ||
                      int.tryParse(value) == null ||
                      int.tryParse(value)! >= 0) {
                    return 'Error';
                  }
                  return null;
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                      child: TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Quantity'),
                    ),
                    initialValue: '1',
                  )),
                  const SizedBox(
                    width: 6,
                  ),
                  Expanded(
                      child: DropdownButtonFormField(items: [
                    for (final category in categories.entries)
                      DropdownMenuItem(
                          value: category.value,
                          child: Row(
                            children: [
                              Container(
                                height: 16,
                                width: 16,
                                color: category.value.color,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(category.value.title)
                            ],
                          ))
                  ], onChanged: (value) {}))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: () {}, child: const Text('Reset')),
                  const SizedBox(
                    width: 6,
                  ),
                  ElevatedButton(
                      onPressed: () {}, child: const Text('Add Item'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

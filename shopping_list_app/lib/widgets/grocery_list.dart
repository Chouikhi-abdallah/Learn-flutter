import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shopping_list_app/data/categories.dart';
import 'package:shopping_list_app/models/grocery_item.dart';
import 'package:shopping_list_app/widgets/new_item.dart';
import 'package:http/http.dart' as http;

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  bool _isLoading = true;
  List<GroceryItem> groceryList = [];
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _loadItems() async {
    try {
      final url = Uri.https('flutte-212ba-default-rtdb.firebaseio.com', 'shopping-list.json');
      final response = await http.get(url);

      if (response.statusCode >= 400) {
        setState(() {
          _error = "Failed to load... Please try again.";
          _isLoading = false;
        });
        return;
      }

      if (response.body == 'null') {
        setState(() {
          _isLoading = false;
          groceryList = [];
        });
        return;
      }

      final Map<String, dynamic> listData = jsonDecode(response.body);
      final List<GroceryItem> loadedItems = [];

      for (final item in listData.entries) {
        final categoryEntry = categories.entries.firstWhere(
          (catItem) => item.value['category'] == catItem.value.title,
        );

        loadedItems.add(
          GroceryItem(
            id: item.key,
            name: item.value["title"],
            quantity: item.value["quantity"],
            category: categoryEntry.value,
          ),
        );
      }

      setState(() {
        groceryList = loadedItems;
        _isLoading = false;
      });
    } catch (err) {
      setState(() {
        _error = "Something went wrong. Please check your internet connection.";
        _isLoading = false;
      });
    }
  }

  void _addNewItem() async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx) => NewItem()),
    );

    if (result == null) return;

    setState(() {
      groceryList.add(result);
    });
  }

  void _removeItem(GroceryItem item) async {
    final url = Uri.https('flutter-212ba-default-rtdb.firebaseio.com', 'shopping-list/${item.id}.json');
    final int indexOfItem = groceryList.indexOf(item);

    if (indexOfItem == -1) return; // Avoid errors if item is not found

    final removedItem = groceryList[indexOfItem];

    setState(() {
      groceryList.removeAt(indexOfItem);
    });

    final response = await http.delete(url);

    if (response.statusCode >= 400) {
      // Restore item if delete fails
      setState(() {
        groceryList.insert(indexOfItem, removedItem);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to remove item. Try again!')),
      );
      return;
    }

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 4),
        content: const Text('Removed successfully'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () async {
            final restoreUrl = Uri.https(
                'flutter-212ba-default-rtdb.firebaseio.com', 'shopping-list/${item.id}.json');

            await http.put(
              restoreUrl,
              headers: {'Content-Type': 'application/json'},
              body: jsonEncode({
                'title': item.name,
                'quantity': item.quantity,
                'category': item.category.title,
              }),
            );

            setState(() {
              groceryList.insert(indexOfItem, removedItem);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_error != null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Your Groceries'),
          actions: [
            IconButton(
              onPressed: _addNewItem,
              icon: const Icon(Icons.add),
            )
          ],
        ),
        body: Center(child: Text(_error!)),
      );
    }

    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed: _addNewItem,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: groceryList.isEmpty
          ? Center(
              child: Text(
                'Uh ... nothing here, try adding some new items',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            )
          : ListView.builder(
              itemCount: groceryList.length,
              itemBuilder: (ctx, index) => Dismissible(
                background: Container(
                  color: Theme.of(context).colorScheme.error,
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
                onDismissed: (direction) {
                  _removeItem(groceryList[index]);
                },
                key: ValueKey(groceryList[index].id),
                child: ListTile(
                  title: Text(groceryList[index].name),
                  leading: Container(
                    width: 24,
                    height: 24,
                    color: groceryList[index].category.color,
                  ),
                  trailing: Text(
                    groceryList[index].quantity.toString(),
                  ),
                ),
              ),
            ),
    );
  }
}

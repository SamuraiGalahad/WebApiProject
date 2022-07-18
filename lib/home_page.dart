import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'catalog.dart';
import 'item_tile.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  Widget searchView(){
    return Padding(
      padding:const EdgeInsets.fromLTRB(20, 25, 20, 15),
      child:  TextField(
        controller: TextEditingController(),
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: TextStyle(color: Colors.grey[300]),
          prefixIcon: const Icon(Icons.search),
          border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
        ),
        textAlign: TextAlign.left,
        textAlignVertical: TextAlignVertical.bottom
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        flexibleSpace: searchView()
      ),
      body: Selector<Catalog, int?>(
        // Selector is a widget from package:provider. It allows us to listen
        // to only one aspect of a provided value. In this case, we are only
        // listening to the catalog's `itemCount`, because that's all we need
        // at this level.
        selector: (context, catalog) => catalog.itemCount,
        builder: (context, itemCount, child) => ListView.builder(
          // When `itemCount` is null, `ListView` assumes an infinite list.
          // Once we provide a value, it will stop the scrolling beyond
          // the last element.
          itemCount: itemCount,
          padding: const EdgeInsets.symmetric(vertical: 18),
          itemBuilder: (context, index) {
            // Every item of the `ListView` is individually listening
            // to the catalog.
            var catalog = Provider.of<Catalog>(context);

            // Catalog provides a single synchronous method for getting
            // the current data.
            var item = catalog.getByIndex(index);

            if (item.isLoading) {
              return const LoadingItemTile();
            }

            return ItemTile(item: item);
          },
        ),
      ),
    );
  }
}
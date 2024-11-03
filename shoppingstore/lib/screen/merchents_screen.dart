import 'package:flutter/material.dart';
import 'package:shoppingstore/widget/card_merchents.dart';
import 'package:shoppingstore/model/store_merchants.dart';
import 'package:shoppingstore/data/json_converter.dart';

class MerchentsScreen extends StatefulWidget {
  const MerchentsScreen({super.key});

  @override
  State<MerchentsScreen> createState() {
    return _MerchentsScreenState();
  }
}

class _MerchentsScreenState extends State<MerchentsScreen> {
  late Future<List<Store>> futureStores;

  @override
  void initState() {
    super.initState();
    futureStores = loadStores(); // Load stores when the widget is initialized
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            margin: const EdgeInsets.only(top: 40.0),
            child: Column(
              children: [
                const Text('Additional text below the ListView',
                    style: TextStyle(fontSize: 18)),
                const SizedBox(height: 20),
                Expanded(
                  child: FutureBuilder<List<Store>>(
                    future: futureStores,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(
                            child: Text('No stores available.'));
                      }
                      final stores = snapshot.data!;
                      return ListView.builder(
                        itemCount: stores.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            child: CardMerchents(store: stores[index]),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

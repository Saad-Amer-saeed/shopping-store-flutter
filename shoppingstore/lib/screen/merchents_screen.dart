import 'package:flutter/material.dart';
import 'package:shoppingstore/widget/card_merchents.dart';
import 'package:shoppingstore/model/store_merchants.dart';
import 'package:shoppingstore/data/json_converter.dart';
import 'package:shoppingstore/widget/filter_button .dart';

class MerchentsScreen extends StatefulWidget {
  const MerchentsScreen({super.key});

  @override
  State<MerchentsScreen> createState() {
    return _MerchentsScreenState();
  }
}

class _MerchentsScreenState extends State<MerchentsScreen> {
  late Future<List<Store>> futureStores;
  List<Store> allStores = []; // To hold all the stores
  List<Store> filteredStores = []; // To hold filtered stores
  List<Store> baseStores = []; // To hold filtered stores
  List<Store> fillter = []; // To hold filtered stores

  @override
  void initState() {
    super.initState();
    futureStores = loadStores(); // Load stores when the widget is initialized
    futureStores.then((stores) {
      setState(() {
        allStores = stores;
        filteredStores = stores; // Initialize filtered stores
      });
    });
  }

  void _searchfillter(
    String enteredKeyword,
  ) {
    fillter = baseStores.isEmpty ? allStores : baseStores;

    setState(() {
      filteredStores = fillter.where((store) {
        final matchesKeyword = enteredKeyword.isEmpty ||
            store.storeName
                .toLowerCase()
                .contains(enteredKeyword.toLowerCase());

        return matchesKeyword;
      }).toList();
    });
  }

  void _runFilter({
    bool rateFilter = false,
    bool freeFilter = false,
    bool discountFilter = false,
    bool reset = false,
  }) {
    setState(() {
      // If reset is true, set baseStores back to allStores and skip other filters
      if (reset) {
        baseStores = allStores;
      } else {
        baseStores = allStores;

        // Apply rating filter
        if (rateFilter) {
          baseStores =
              baseStores.where((store) => store.storeRate > 4).toList();
        }

        // Apply free delivery filter
        if (freeFilter) {
          baseStores = baseStores
              .where((store) => store.storeDeliveryPrice < 1)
              .toList();
        }

        // Apply discount filter
        if (discountFilter) {
          baseStores = baseStores
              .where((store) => store.discountPercentage > 0)
              .toList();
        }
      }

      // Update filteredStores based on the selected filters
      filteredStores = baseStores;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            margin: const EdgeInsets.only(top: 40.0, right: 20, left: 20),
            child: Column(
              children: [
                TextField(
                  onChanged: (value) => _searchfillter(value),
                  decoration: const InputDecoration(
                      labelText: 'Search', suffixIcon: Icon(Icons.search)),
                ),
                const SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      FilterButton(
                        label: "Sort",
                        onPressed: () => _runFilter(rateFilter: true),
                      ),
                      const SizedBox(width: 10),
                      FilterButton(
                        label: "Rate",
                        onPressed: () => _runFilter(rateFilter: true),
                      ),
                      const SizedBox(width: 10),
                      FilterButton(
                        label: "Free",
                        onPressed: () => _runFilter(freeFilter: true),
                      ),
                      const SizedBox(width: 10),
                      FilterButton(
                        label: "Discount",
                        onPressed: () => _runFilter(discountFilter: true),
                      ),
                      const SizedBox(width: 10),
                      FilterButton(
                        label: "Reset",
                        onPressed: () => _runFilter(reset: true),
                      ),
                    ],
                  ),
                ),
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
                      final stores = filteredStores;
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

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
  List<Store> allStores = []; // To hold all the stores
  List<Store> filteredStores = []; // To hold filtered stores

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

  // void _runFilter(String enteredKeyword,
  //     {bool rateFilter = false, bool freeFilter = false, disaccount = false}) {
  //   if (enteredKeyword.isEmpty && !rateFilter && !freeFilter && !disaccount) {
  //     // If the search field is empty and no rate filter, show all stores
  //     setState(() {
  //       filteredStores = allStores;
  //     });
  //   } else {
  //     setState(() {
  //       filteredStores = allStores.where((store) {
  //         final matchesKeyword = store.storeName
  //             .toLowerCase()
  //             .contains(enteredKeyword.toLowerCase());
  //         final matchesRating = rateFilter
  //             ? store.storeRate > 4
  //             : true; // Assume store.rating exists
  //         final matchesfree = freeFilter
  //             ? store.storeDeliveryPrice < 1
  //             : true; // Assume store.rating exists
  //         final disaccountfree = disaccount
  //             ? store.discountPercentage > 0
  //             : true; // Assume store.rating exists

  //         return matchesKeyword &&
  //             matchesRating &&
  //             matchesfree &&
  //             disaccountfree;
  //       }).toList();
  //     });
  //   }
  // }

  void _runFilter(String enteredKeyword,
      {bool rateFilter = false,
      bool freeFilter = false,
      bool disaccount = false}) {
    setState(() {
      // Start with all stores
      // List<Store> baseStores = allStores;
      List<Store> baseStores = allStores;
      // If the rating filter is applied, filter by rating first
      if (rateFilter) {
        baseStores = baseStores.where((store) => store.storeRate > 4).toList();
      }

      // If the free delivery filter is applied, filter by delivery price next
      if (freeFilter) {
        baseStores =
            baseStores.where((store) => store.storeDeliveryPrice < 1).toList();
      }

      // If the discount filter is applied, filter by discount percentage next
      if (disaccount) {
        baseStores =
            baseStores.where((store) => store.discountPercentage > 0).toList();
      }

      // Now apply the keyword filter on the filtered baseStores
      filteredStores = baseStores.where((store) {
        final matchesKeyword = enteredKeyword.isEmpty ||
            store.storeName
                .toLowerCase()
                .contains(enteredKeyword.toLowerCase());

        // Return true if the keyword matches, as other filters have already been applied
        return matchesKeyword;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    print(filteredStores);
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            margin: const EdgeInsets.only(top: 40.0, right: 20, left: 20),
            child: Column(
              children: [
                TextField(
                  onChanged: (value) => _runFilter(value),
                  decoration: const InputDecoration(
                      labelText: 'Search', suffixIcon: Icon(Icons.search)),
                ),
                ElevatedButton(
                  onPressed: () {
                    _runFilter('',
                        rateFilter: true); // Filter for stores with rating > 4
                  },
                  child: Text('Rate'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _runFilter('',
                        freeFilter: true); // Filter for stores with rating > 4
                  },
                  child: Text('Free'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _runFilter('',
                        disaccount: true); // Filter for stores with rating > 4
                  },
                  child: Text('Disaccount'),
                ),
                const SizedBox(height: 30),
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

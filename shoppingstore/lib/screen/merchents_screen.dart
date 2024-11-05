import 'package:flutter/material.dart';
import 'package:shoppingstore/widget/card_merchents.dart';
import 'package:shoppingstore/model/store_merchants.dart';
import 'package:shoppingstore/data/json_converter.dart';
import 'package:shoppingstore/widget/filter_button .dart';
import 'package:shoppingstore/widget/sort_options_dialog.dart';
import 'package:shoppingstore/screen/store_item_screen.dart';

class MerchentsScreen extends StatefulWidget {
  const MerchentsScreen({super.key});

  @override
  State<MerchentsScreen> createState() {
    return _MerchentsScreenState();
  }
}

class _MerchentsScreenState extends State<MerchentsScreen> {
  late Future<List<Store>> futureStores;
  List<Store> allStores = [];
  List<Store> filteredStores = [];
  List<Store> baseStores = [];
  List<Store> fillter = [];
  String? selectedOption;

  @override
  void initState() {
    super.initState();
    futureStores = loadStores();
    futureStores.then((stores) {
      setState(() {
        allStores = stores;
        filteredStores = stores;
      });
    });
  }

//sort bar function

  void _sortingMerchents(String? selectOptions) {
    setState(() {
      if (selectOptions == 'HighestRating') {
        // Sort by highest rating
        allStores.sort((a, b) => b.storeRate.compareTo(a.storeRate));
      } else if (selectOptions == 'AtoZ') {
        // Sort by store name A to Z
        allStores.sort((a, b) => a.storeName.compareTo(b.storeName));
      } else if (selectOptions == 'New') {
        // Sort by store name A to Z
        allStores.sort(
            (a, b) => b.storeDateActivated.compareTo(a.storeDateActivated));
      }
    });
  }

// Search  bar function

  void _searchfillter(String enteredKeyword) {
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

//filtter bar function  depend on Rate>4 freeDelivry or  Disacount
  void _runFilter({
    bool rateFilter = false,
    bool freeFilter = false,
    bool discountFilter = false,
    bool reset = false,
  }) {
    setState(() {
      if (reset) {
        baseStores = allStores;
      } else {
        baseStores = allStores;

        if (rateFilter) {
          baseStores =
              baseStores.where((store) => store.storeRate > 4).toList();
        }
        if (freeFilter) {
          baseStores = baseStores
              .where((store) => store.storeDeliveryPrice < 1)
              .toList();
        }
        if (discountFilter) {
          baseStores = baseStores
              .where((store) => store.discountPercentage > 0)
              .toList();
        }
      }
      filteredStores = baseStores;
    });
  }

  void _showModel() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SortOptionsDialog(
              selectedOption: selectedOption,
              onOptionSelected: (String? option) {
                setState(() {
                  selectedOption = option;
                  _sortingMerchents(selectedOption);
                });
              },
            );
          },
        );
      },
    );
  }

  void _selectedStore(
      storeId, storeBackgroundImage, storeName, storeLogo, storeRate) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StoreItemScreen(
            storeId, storeBackgroundImage, storeName, storeLogo, storeRate),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
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
                      onPressed: () => _showModel(),
                    ),
                    const SizedBox(width: 10),
                    FilterButton(
                      label: "Rate+4",
                      onPressed: () => _runFilter(rateFilter: true),
                    ),
                    const SizedBox(width: 10),
                    FilterButton(
                      label: "Free Delivary",
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
                      return const Center(child: Text('No stores available.'));
                    }
                    final stores = filteredStores;
                    return ListView.builder(
                      itemCount: stores.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          child: CardMerchents(
                            store: stores[index],
                            onTap: (storeId, storeBackgroundImage, storeName,
                                    storeLogo, storeRate) =>
                                _selectedStore(storeId, storeBackgroundImage,
                                    storeName, storeLogo, storeRate),
                          ),
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
    );
  }
}

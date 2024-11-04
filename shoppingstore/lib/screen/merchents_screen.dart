// import 'package:flutter/material.dart';
// import 'package:shoppingstore/widget/card_merchents.dart';
// import 'package:shoppingstore/model/store_merchants.dart';
// import 'package:shoppingstore/data/json_converter.dart';
// import 'package:shoppingstore/widget/filter_button .dart';
// import 'package:shoppingstore/widget/cheack_box_card.dart';

// class MerchentsScreen extends StatefulWidget {
//   const MerchentsScreen({super.key});

//   @override
//   State<MerchentsScreen> createState() {
//     return _MerchentsScreenState();
//   }
// }

// class _MerchentsScreenState extends State<MerchentsScreen> {
//   late Future<List<Store>> futureStores;
//   List<Store> allStores = []; // To hold all the stores
//   List<Store> filteredStores = []; // To hold filtered stores
//   List<Store> baseStores = []; // To hold filtered stores
//   List<Store> fillter = []; // To hold filtered stores
//   String? selectedOption;
//   @override
//   void initState() {
//     super.initState();
//     futureStores = loadStores(); // Load stores when the widget is initialized
//     futureStores.then((stores) {
//       setState(() {
//         allStores = stores;
//         filteredStores = stores; // Initialize filtered stores
//       });
//     });
//   }

//   void _searchfillter(
//     String enteredKeyword,
//   ) {
//     fillter = baseStores.isEmpty ? allStores : baseStores;

//     setState(() {
//       filteredStores = fillter.where((store) {
//         final matchesKeyword = enteredKeyword.isEmpty ||
//             store.storeName
//                 .toLowerCase()
//                 .contains(enteredKeyword.toLowerCase());

//         return matchesKeyword;
//       }).toList();
//     });
//   }

//   void _runFilter({
//     bool rateFilter = false,
//     bool freeFilter = false,
//     bool discountFilter = false,
//     bool reset = false,
//   }) {
//     setState(() {
//       // If reset is true, set baseStores back to allStores and skip other filters
//       if (reset) {
//         baseStores = allStores;
//       } else {
//         baseStores = allStores;

//         // Apply rating filter
//         if (rateFilter) {
//           baseStores =
//               baseStores.where((store) => store.storeRate > 4).toList();
//         }

//         // Apply free delivery filter
//         if (freeFilter) {
//           baseStores = baseStores
//               .where((store) => store.storeDeliveryPrice < 1)
//               .toList();
//         }

//         // Apply discount filter
//         if (discountFilter) {
//           baseStores = baseStores
//               .where((store) => store.discountPercentage > 0)
//               .toList();
//         }
//       }

//       // Update filteredStores based on the selected filters
//       filteredStores = baseStores;
//     });
//   }

//   void _showModel() {
//     showModalBottomSheet(
//       context: context,
//       builder: (ctx) {
//         return Container(
//           height: 300,
//           padding: EdgeInsets.all(16.0),
//           color: Colors.white,
//           child: Column(
//             children: [
//               ListTile(
//                 title: Text('Saad'),
//                 leading: Radio<String>(
//                   value: 'Saad',
//                   groupValue: selectedOption,
//                   onChanged: (String? value) {
//                     setState(() {
//                       selectedOption = value;
//                     });
//                   },
//                 ),
//               ),
//               ListTile(
//                 title: Text('Ahmed'),
//                 leading: Radio<String>(
//                   value: 'Ahmed',
//                   groupValue: selectedOption,
//                   onChanged: (String? value) {
//                     setState(() {
//                       selectedOption = value;
//                     });
//                   },
//                 ),
//               ),
//               ListTile(
//                 title: Text('Aymen'),
//                 leading: Radio<String>(
//                   value: 'Aymen',
//                   groupValue: selectedOption,
//                   onChanged: (String? value) {
//                     setState(() {
//                       selectedOption = value;
//                     });
//                   },
//                 ),
//               ),
//               SizedBox(height: 20),
//               Text('Selected Option: $selectedOption'),

//               // Align(
//               //   alignment: Alignment.centerLeft, // Aligns the text to the left
//               //   child: Text(
//               //     'Sort By ',
//               //     style: TextStyle(
//               //       fontSize: 18,
//               //       fontWeight: FontWeight.bold,
//               //     ),
//               //   ),
//               // ),
//               // SizedBox(
//               //   height: 12,
//               // ),
//               // Row(
//               //   children: [
//               //     Text(
//               //       'Closest',
//               //       style: TextStyle(
//               //         fontSize: 18,
//               //         // fontWeight: FontWeight.bold,
//               //       ),
//               //     ),
//               //     Spacer(),
//               //     Checkboxcard(),
//               //   ],
//               // ),
//               // Divider(), // Add the Divider here
//               // Row(
//               //   children: [
//               //     Text(
//               //       'A to Z',
//               //       style: TextStyle(
//               //         fontSize: 18,
//               //         // fontWeight: FontWeight.bold,
//               //       ),
//               //     ),
//               //     Spacer(),
//               //     Checkboxcard(),
//               //   ],
//               // ),
//               // Divider(), // Add the Divider here
//               // Row(
//               //   children: [
//               //     Text(
//               //       'Highest Rating',
//               //       style: TextStyle(
//               //         fontSize: 18,
//               //         // fontWeight: FontWeight.bold,
//               //       ),
//               //     ),
//               //     Spacer(),
//               //     Checkboxcard(),
//               //   ],
//               // ),
//               // Divider(),
//               // You can add more widgets below the Divider if needed
//             ],
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     print(selectedOption);
//     return MaterialApp(
//       home: Center(
//         child: Container(
//           margin: const EdgeInsets.only(top: 40.0, right: 20, left: 20),
//           child: Column(
//             children: [
//               TextField(
//                 onChanged: (value) => _searchfillter(value),
//                 decoration: const InputDecoration(
//                     labelText: 'Search', suffixIcon: Icon(Icons.search)),
//               ),
//               const SizedBox(height: 20),
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: [
//                     FilterButton(
//                       label: "Sort",
//                       onPressed: () => _showModel(),
//                     ),
//                     const SizedBox(width: 10),
//                     FilterButton(
//                       label: "Rate",
//                       onPressed: () => _runFilter(rateFilter: true),
//                     ),
//                     const SizedBox(width: 10),
//                     FilterButton(
//                       label: "Free",
//                       onPressed: () => _runFilter(freeFilter: true),
//                     ),
//                     const SizedBox(width: 10),
//                     FilterButton(
//                       label: "Discount",
//                       onPressed: () => _runFilter(discountFilter: true),
//                     ),
//                     const SizedBox(width: 10),
//                     FilterButton(
//                       label: "Reset",
//                       onPressed: () => _runFilter(reset: true),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Expanded(
//                 child: FutureBuilder<List<Store>>(
//                   future: futureStores,
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return const Center(child: CircularProgressIndicator());
//                     } else if (snapshot.hasError) {
//                       return Center(child: Text('Error: ${snapshot.error}'));
//                     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                       return const Center(child: Text('No stores available.'));
//                     }
//                     final stores = filteredStores;
//                     return ListView.builder(
//                       itemCount: stores.length,
//                       itemBuilder: (context, index) {
//                         return Container(
//                           margin: const EdgeInsets.symmetric(vertical: 8.0),
//                           child: CardMerchents(store: stores[index]),
//                         );
//                       },
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:shoppingstore/widget/card_merchents.dart';
import 'package:shoppingstore/model/store_merchants.dart';
import 'package:shoppingstore/data/json_converter.dart';

import 'package:shoppingstore/widget/cheack_box_card.dart';
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
            return Container(
              height: 300,
              padding: EdgeInsets.all(16.0),
              color: Colors.white,
              child: Column(
                children: [
                  const Align(
                    alignment:
                        Alignment.centerLeft, // Aligns the text to the left
                    child: Text(
                      'Sort By ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ListTile(
                    title: Text('New'),
                    trailing: Radio<String>(
                      // Changed to trailing
                      value: 'New',
                      groupValue: selectedOption,
                      onChanged: (String? value) {
                        setState(() {
                          selectedOption = value;
                          _sortingMerchents(selectedOption);
                        });
                      },
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    title: Text('Highest Rating'),
                    trailing: Radio<String>(
                      // Changed to trailing
                      value: 'HighestRating',
                      groupValue: selectedOption,
                      onChanged: (String? value) {
                        setState(() {
                          selectedOption = value;
                          _sortingMerchents(selectedOption);
                        });
                      },
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    title: Text('A TO Z'),
                    trailing: Radio<String>(
                      // Changed to trailing
                      value: 'AtoZ',
                      groupValue: selectedOption,
                      onChanged: (String? value) {
                        setState(() {
                          selectedOption = value;
                          _sortingMerchents(selectedOption);
                        });
                      },
                    ),
                  ),
                  const Divider(),

                  // SizedBox(height: 20),
                  // Text('Selected Option: $selectedOption'),
                ],
              ),
            );
          },
        );
      },
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
                      return const Center(child: Text('No stores available.'));
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
    );
  }
}

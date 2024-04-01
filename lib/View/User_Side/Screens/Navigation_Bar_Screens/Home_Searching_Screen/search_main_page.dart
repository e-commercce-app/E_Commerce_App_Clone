import 'package:e_commerce/Components/Error/route_not_found_page.dart';
import 'package:e_commerce/Components/Widgets/custom_grid_view_design.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Components/Widgets/custom_search_bar_text_field.dart';
import '../../../../../Components/Widgets/custom_shoes_page_design.dart';
import '../../../../../Export/e_commerce_export.dart';
import '../../../../../Models/shoes_product_home_page.dart';
import 'Components/custom_search_app_bar.dart';
import 'bloc/search_bloc.dart';
import 'bloc/search_state.dart';

class SearchingTextField extends StatefulWidget {
  const SearchingTextField({super.key});

  @override
  State<SearchingTextField> createState() => _SearchingTextFieldState();
}

class _SearchingTextFieldState extends State<SearchingTextField> {
  String? searchQuery;
  List<Map<String, dynamic>> searchResults = [];

  Stream getSearchBarFirebaseData() {
    return FirebaseServices.nikeShoesCollection
        .where("productName", isGreaterThanOrEqualTo: searchQuery)
        .where("productName", isLessThan: "${searchQuery}z")
        .get()
        .then((querySnapshot) {
      setState(() {
        searchResults = querySnapshot.docs.map((doc) => doc.data()).toList();
      });
    }).asStream();
  }

  // Screen Size .
  late Size size;

  @override
  void initState() {
    super.initState();
    getSearchBarFirebaseData();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      (state as SearchInitialState);
      return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: searchingAppBar(
            size: size,
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 5,
            ),
            child: Column(
              children: [
                // ! Search Text Field Sections .
                CustomSearchView(
                  controller: state.searchController,
                  hintText: "Looking for shoes search.....",
                  readOnly: false,
                  suffix: Padding(
                    padding: const EdgeInsets.only(
                      right: 15,
                    ),
                    child: IconButton(
                      onPressed: () => state.searchController.clear(),
                      icon: Icon(
                        Icons.clear,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                  onFieldSubmitted: (value) {
                    getSearchBarFirebaseData();
                  },
                ),

                //
                Expanded(
                  child: CustomGridView(
                    itemCount: searchResults.length,
                    itemBuilder: (BuildContext context, int index) {
                      return searchResults.isEmpty
                          ? NotFound404Error(
                              imagePath: Resources.imagePath.notFound)
                          : CustomProductShoesDesign(
                              // Fetch Images
                              productImage: searchResults[index]
                                  ["productImage"],
                              productName: searchResults[index]["productName"],
                              productPrice: searchResults[index]
                                  ["productPrice"],
                              heroTag: searchResults[index]["productImage"],
                              onTap: () {
                                // ** Detail Page .
                                NavigatorService.pushNamed(
                                    RoutesName.detailScreen,
                                    arguments: ProductShoesHomePage(
                                      productImage: searchResults[index]
                                          ["productImage"],
                                      productName: searchResults[index]
                                          ["productName"],
                                      productPrice: searchResults[index]
                                          ["productPrice"],
                                    ));
                              },
                            );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}

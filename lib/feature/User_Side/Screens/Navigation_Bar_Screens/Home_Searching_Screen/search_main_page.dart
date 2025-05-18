import 'package:e_commerce/Export/e_commerce_export.dart';
import 'package:e_commerce/Models/shoes_product_home_page.dart';
import 'package:e_commerce/core/Components/Error/route_not_found_page.dart';
import 'package:e_commerce/feature/User_Side/Screens/Navigation_Bar_Screens/Home_Searching_Screen/Components/custom_search_app_bar.dart';
import 'package:e_commerce/feature/User_Side/Screens/Navigation_Bar_Screens/Home_Searching_Screen/bloc/search_bloc.dart';
import 'package:e_commerce/feature/User_Side/Screens/Navigation_Bar_Screens/Home_Searching_Screen/bloc/search_state.dart';

class SearchingTextField extends StatefulWidget {
  const SearchingTextField({super.key});

  @override
  State<SearchingTextField> createState() => _SearchingTextFieldState();
}

class _SearchingTextFieldState extends State<SearchingTextField> {
  // String? searchQuery;
  List<Map<String, dynamic>> searchResults = [];

  Stream<void> getSearchBarFirebaseData(String? searchQuery) {
    return FirebaseServices.nikeShoesCollection
        .where('productName', isGreaterThanOrEqualTo: searchQuery)
        .where('productName', isLessThan: '$searchQuery')
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
    // getSearchBarFirebaseData();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
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
                    hintText: lookingForShoesSearch,
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
                        getSearchBarFirebaseData(value);
                      });
                    },
                    onFieldSubmitted: (value) {
                      // getSearchBarFirebaseData();
                    },
                  ),

                  //
                  Expanded(
                    child: CustomGridView(
                      itemCount: searchResults.length,
                      itemBuilder: (BuildContext context, int index) {
                        return searchResults.isEmpty
                            ? NotFound404Error(
                                imagePath: Resources.imagePath.notFound,
                              )
                            : CustomProductShoesDesign(
                                // Fetch Images
                                productImage: searchResults[index]
                                    ['productImage'] as String,
                                productName: searchResults[index]['productName']
                                    as String,
                                fullPrice:
                                    searchResults[index]['fullPrice'] as num,
                                heroTag: searchResults[index]['productImage']
                                    as String,
                                onTap: () {
                                  // ** Detail Page .
                                  NavigatorService.pushNamed(
                                    RoutesName.detailScreen,
                                    arguments: ProductShoesHomePageModel(
                                      productImage: searchResults[index]
                                          ['productImage'] as String,
                                      productName: searchResults[index]
                                          ['productName'] as String,
                                      fullPrice: searchResults[index]
                                          ['fullPrice'] as num,
                                      isSale: searchResults[index]['isSale']
                                          as bool,
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
      },
    );
  }
}

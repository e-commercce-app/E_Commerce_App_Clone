import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/Export/e_commerce_export.dart';
import 'package:e_commerce/Models/category_model.dart';
import 'package:e_commerce/feature/User_Side/Screens/OnBoarding_Screen/Bloc/page_view_bloc.dart';
import 'package:e_commerce/init.dart';

void main() async {
  //! On Create initial Data Load .
  await initDataLoad();
  // Set this PreferredOrientations .
  await Future.wait([
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
    ),
  ]).then((value) {
    runApp(const ECommerce());
  });
}

class ECommerce extends StatelessWidget {
  const ECommerce({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageViewBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: NavigatorService.navigatorKey,
        title: shoesECommerce,
        theme: eCommerceTheme,
        initialRoute: RoutesName.splashScreen,
        onGenerateRoute: RoutesMethod.onGenerateRoutes,
        // home: const CategoriesTab(),
      ),
    );
  }
}

class CategoriesTab extends StatefulWidget {
  const CategoriesTab({super.key});

  @override
  State<CategoriesTab> createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
  // late Future<List<CategoriesModel>> categoriesFuture;

  @override
  void initState() {
    super.initState();
    // categoriesFuture = FirebaseService().fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseServices.categoryCollection
            .orderBy('createdAt', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No categories found'));
          } else {
            final categories = snapshot.data!;
            return ListView.builder(
              itemCount: categories.docs.length,
              itemBuilder: (context, index) {
                final cat = categories.docs[index];
                return ListTile(
                  leading: Image.network(cat['categoryImg'].toString()),
                  title: Text(cat['categoryName'].toString()),
                  subtitle: Text('ID: ${cat['categoryId']}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<CategoriesModel>> fetchCategories() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('category').get();

      final categories = snapshot.docs.map((doc) {
        return CategoriesModel.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();

      return categories;
    } catch (e) {
      log('Error fetching categories: $e');
      return [];
    }
  }
}

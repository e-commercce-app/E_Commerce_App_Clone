import 'package:e_commerce/View/Screens/Home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Components/Resources/e_commerce_theme.dart';
import 'Export/e_commerce_export.dart';
import 'firebase_options.dart';

void main() async {
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shoes_E_Commerce',
      theme: eCommerceTheme,
      home: const HomeScreen(),
    );
  }
}

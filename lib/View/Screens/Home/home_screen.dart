import 'package:e_commerce/Components/Navigator_Service/navigator_services.dart';
import 'package:e_commerce/Components/Widgets/custom_toast.dart';
import 'package:e_commerce/Controller/Services/firebase_services.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../Export/e_commerce_export.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        actions: [
          IconButton(
              onPressed: () async {
                await GoogleSignIn().signOut().then((value) {
                  NavigatorService.goBack();
                  toastMessage(message: "Google Sign Out");
                });
              },
              icon: const Icon(Icons.logout))
        ],
      ),
    );
  }
}

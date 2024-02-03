import 'package:google_sign_in/google_sign_in.dart';

import 'package:e_commerce/Components/Navigator_Service/navigator_services.dart';

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
                  CustomDialog.toastMessage(message: "Google Sign Out");
                });
              },
              icon: const Icon(Icons.logout))
        ],
      ),
    );
  }
}

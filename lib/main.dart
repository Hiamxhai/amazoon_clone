import 'package:amazoon_clone/layout/screen_lauout.dart';
import 'package:amazoon_clone/model/product_model.dart';
import 'package:amazoon_clone/providers/user_details_provider.dart';
import 'package:amazoon_clone/screens/product_screen.dart';
import 'package:amazoon_clone/screens/result_screen.dart';
import 'package:amazoon_clone/screens/sell_screen.dart';
import 'package:amazoon_clone/screens/sig_in_screens.dart';
import 'package:amazoon_clone/utils/color_themes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb) {
    await Firebase.initializeApp(
          options: const FirebaseOptions(
        apiKey: "AIzaSyCW8_1u2SEfu9L9pOee_sQMOymqhhwTfvc",
        authDomain: "clone-bd4c3.firebaseapp.com",
        projectId: "clone-bd4c3",
        storageBucket: "clone-bd4c3.appspot.com",
        messagingSenderId: "671818082702",
        appId: "1:671818082702:web:6dd20f2cb7c7ec71701cdf"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const AmazonClone());
}

class AmazonClone extends StatelessWidget {
  const AmazonClone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserDetailsprovider())
      ],
      child: MaterialApp(
          title: 'AmazonClone',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: backgroundColor,
          ),
          home: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, AsyncSnapshot<User?> user) {
              if (user.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator(
                  color: Colors.orange,
                  ),
                );
              } else if (user.hasData){
                 return const ScreenLayout();

              } else {
                return const SignInScreen();
              }
            },
          ),
      ),
    );
  }
}

import 'package:chat_app/authentication/auth.dart';
import 'package:chat_app/controller/auth_provider.dart';
import 'package:chat_app/controller/post_provider.dart';
import 'package:chat_app/controller/profile_provider.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AutheProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PostProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileProvider(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthPage(),
      ),
    );
  }
}

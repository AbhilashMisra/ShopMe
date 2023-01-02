import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shop_me/firebase_options.dart';

void setupApplication() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initialise firebase for our app
  var app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print("Appid: ${app.options.appId}");
}

void main() {
  // initialise the required dependency before app starts
  setupApplication();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyTestPage(),
    );
  }
}

class MyTestPage extends StatelessWidget {
  const MyTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Firebase Login"),
            MaterialButton(
              color: Colors.blueAccent,
              onPressed: () async {
                // Using test id to register the user
                var cred =
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: "test@shopme.com",
                  password: "pass#123",
                );
                print("Registered in id: ${cred.user?.uid}");
              },
              child: const Text("Register"),
            ),
            MaterialButton(
              color: Colors.cyan,
              onPressed: () async {
                // Using test id to login the user
                var cred =
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: "test@shopme.com",
                  password: "pass#123",
                );
                print("Logged in id: ${cred.user?.uid}");
              },
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}

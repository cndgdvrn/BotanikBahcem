import 'package:botanik_bahcem/features/home/presentation/pages/home_page.dart';
import 'package:botanik_bahcem/features/register/presentation/pages/register_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';




import '../../../../core/global/global.dart';
import '../widgets/error_dialog.dart';
import '../widgets/loading_dialog.dart';
import '../widgets/reuseable_widget.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  formValidation() {
    if (_emailTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {
      // login
      loginNow();
    } else {
      showDialog(
          context: context,
          builder: (c) {
            return ErrorDialog(
              message: "Lütfen email/şifre yazın.",
            );
          });
    }
  }

  loginNow() async {
    showDialog(
        context: context,
        builder: (c) {
          return const LoadingDialog(
            message: "Checking Credentials",
          );
        });

    User? currentUser;
    await fAuth
        .signInWithEmailAndPassword(
      email: _emailTextController.text.trim(),
      password: _passwordTextController.text.trim(),
    )
        .then((auth) {
      currentUser = auth.user!;
    }).catchError((error) {
      Navigator.pop(context);
    });
    // Navigator.pop(context);
    //    Navigator.push(
    //        context, MaterialPageRoute(builder: (c) => HomePage()));

  if (currentUser != null) {
    readDataAndSetDataLocally(currentUser!).then((value) {
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (c) => const HomePage()));
    });
  }
  }

Future readDataAndSetDataLocally(User currentUser) async {
  await FirebaseFirestore.instance
      .collection("users")
      .doc(currentUser.uid)
      .get()
      .then((snapshot) async {
    if (snapshot.exists) {
      sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences!.setString("uid", currentUser.uid);
      await sharedPreferences!
          .setString("email", snapshot.data()!["sellerEmail"]);
      await sharedPreferences!
          .setString("name", snapshot.data()!["sellerName"]);
      await sharedPreferences!
          .setString("photoUrl", snapshot.data()!["sellerAvatarUrl"]);
      Navigator.push(
          context, MaterialPageRoute(builder: (c) => HomePage()));
    } else {
      fAuth.signOut();
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (c) => SignInScreen()));
      showDialog(
          context: context,
          builder: (c) {
            return const ErrorDialog(
              message: "No record exists. ",
            );
          });
    }
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              20, MediaQuery.of(context).size.height * 0.12, 20, 0),
          child: Column(
            children: <Widget>[
              logoImage("assets/images/botanik-bahcem.webp"),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.all(18.0),
                child: Text(
                  'Botanik Bahçem',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontFamily: "Monoton",
                    letterSpacing: 3,
                  ),
                ),
              ),
              SizedBox(height: 20),
              reuseableTextField('Email', Icons.person_outline, false, true,
                  _emailTextController),
              SizedBox(height: 20),
              reuseableTextField('Şifre', Icons.lock_outline, true, true,
                  _passwordTextController),
              SizedBox(height: 40),
              signInSignOutButton(context, true, () {
                formValidation();
              }),
              SizedBox(height: 10),
              signUpOption(context)
            ],
          ),
        ),
      ),

    );

  }
}

Row signUpOption(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Hesabınız yok mu? ",
        style: TextStyle(color: Colors.black),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const RegisterPage()));
        },
        child: Text(
          "Kayıt ol",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    ],
  );
}

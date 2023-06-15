import 'package:botanik_bahcem/core/global/global.dart';
import 'package:botanik_bahcem/features/login/presentation/pages/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          //header drawer
          const ListTile(
            contentPadding:
                EdgeInsets.only(top: 50, bottom: 50, left: 20, right: 20),
            leading: CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage("assets/images/botanik-bahcem.webp"),
            ),
            title: Text(
              "Botanik Bahçem",
              style: TextStyle(fontSize: 22),
            ), //subtitle: Text("Terapist"),
          ),
          const Divider(
            height: 10,
            thickness: 0.1,
          ),

          ListTile(
            onTap: () {},
            contentPadding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            leading: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                CupertinoIcons.person,
                color: Colors.black,
                size: 20,
              ),
            ),
            title: const Text(
              "Bitkini Paylaş",
              style: TextStyle(fontSize: 22),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
          ),

          ListTile(
            onTap: () {},
            contentPadding: const EdgeInsets.only(
              left: 40,
              right: 30,
            ),
            leading: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.person_outline_rounded,
                color: Colors.black,
                size: 15,
              ),
            ),
            title: const Text(
              "Üye Giriş",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 15,
            ),
          ),

          ListTile(
            onTap: () {},
            contentPadding: const EdgeInsets.only(left: 40, right: 30),
            leading: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.yellow[800]!.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.local_hospital_outlined,
                color: Colors.black,
                size: 15,
              ),
            ),
            title: const Text(
              "Sağlık Kuruluşu Kayıt",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 15,
            ),
          ),
          ListTile(
            onTap: () {},
            contentPadding: const EdgeInsets.only(
              left: 40,
              right: 30,
            ),
            leading: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.person_outline_rounded,
                color: Colors.black,
                size: 15,
              ),
            ),
            title: const Text(
              "Doktor Giriş",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 15,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (c) => const SignInScreen()));
              fAuth.signOut();
            },
            contentPadding: const EdgeInsets.only(
              left: 40,
              right: 30,
            ),
            leading: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.exit_to_app,
                color: Colors.black,
                size: 15,
              ),
            ),
            title: const Text(
              "Oturumu Kapat",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 15,
            ),
          ),
          ListTile(
            onTap: () {},
            contentPadding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            leading: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                CupertinoIcons.hand_thumbsup,
                color: Colors.black,
                size: 20,
              ),
            ),
            title: const Text(
              "Anlaşmalı",
              style: TextStyle(fontSize: 22),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
          ),

          ListTile(
            onTap: () {},
            contentPadding: const EdgeInsets.only(
              left: 40,
              right: 30,
            ),
            leading: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.person_outline_rounded,
                color: Colors.black,
                size: 15,
              ),
            ),
            title: const Text(
              "Doktorlarımız",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 15,
            ),
          ),
          ListTile(
            onTap: () {},
            contentPadding: const EdgeInsets.only(
              left: 40,
              right: 30,
            ),
            leading: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.local_convenience_store_outlined,
                color: Colors.black,
                size: 15,
              ),
            ),
            title: const Text(
              "Sağlık Kuruluşları",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 15,
            ),
          ),
          ListTile(
            onTap: () {},
            contentPadding: const EdgeInsets.only(left: 40, right: 30),
            leading: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.yellow[800]!.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.local_convenience_store_outlined,
                color: Colors.black,
                size: 15,
              ),
            ),
            title: const Text(
              "Medikal Firmalar",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 15,
            ),
          ),

          // ListTile(
          //   onTap: (){},
          //   contentPadding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          //   leading: Container(
          //     padding: EdgeInsets.all(15),
          //     decoration: BoxDecoration(
          //       color: Colors.yellowAccent[700]?.withOpacity(0.2),
          //       shape: BoxShape.circle,
          //     ),
          //     child: Icon(Icons.security, color: Colors.black,size: 20,),
          //   ),
          //   title: Text("Güvenlik",style: TextStyle(fontSize: 22),),
          //   trailing: Icon(Icons.arrow_forward_ios_outlined),
          // ),
          // ListTile(
          //   onTap: (){},
          //   contentPadding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          //   leading: Container(
          //     padding: EdgeInsets.all(15),
          //     decoration: BoxDecoration(
          //       color: Colors.green.withOpacity(0.2),
          //       shape: BoxShape.circle,
          //     ),
          //     child: Icon(Icons.settings, color: Colors.black,size: 20,),
          //   ),
          //   title: Text("Genel",style: TextStyle(fontSize: 22),),
          //   trailing: Icon(Icons.arrow_forward_ios_outlined),
          // ),

          //body drawer
        ],
      ),
    );
  }
}

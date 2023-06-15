import 'package:botanik_bahcem/features/bitkisulama/presentation/pages/bitkisulama_page.dart';
import 'package:botanik_bahcem/features/havadurumu/presentation/pages/havadurumu.dart';
import 'package:flutter/material.dart';

import '../../../../core/global/global.dart';
import '../../../login/presentation/pages/login_page.dart';

// bitklieri sulamak için oluşturulacak bir countdown timer  

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          //header drawer
          Container(
            color: Colors.black12,
            padding: const EdgeInsets.only(top: 25, bottom: 10),
            child: Column(
              children: [
                Material(
                  borderRadius: const BorderRadius.all(Radius.circular(80)),
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Container(

                      child: CircleAvatar(
                        radius: 52,
                        backgroundImage: NetworkImage(
                            sharedPreferences!.getString("photoUrl")!
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Text(
                  sharedPreferences!.getString("name")!,
                  style: TextStyle(color: Colors.black, fontSize: 20, fontFamily: "Train"),
                ),
                Text(
                  sharedPreferences!.getString("email")!,
                  style: TextStyle(color: Colors.black, fontSize: 12, fontFamily: "Train"),
                ),
              ],
            ),
          ),



          //body drawer
          Container(
            padding: const EdgeInsets.all(16),
            child: Wrap(
              
              runSpacing: 16,

             children: [



                   ListTile(
                     leading: const Icon(Icons.home, color: Colors.black,),
                     title: const Text(
                       "Ana Sayfa",
                       style: TextStyle(color: Colors.black),
                     ),
                     onTap: ()
                     {

                     },
                   ),

                   ListTile(
                     leading: const Icon(Icons.cloud_circle, color: Colors.black,),
                     title: const Text(
                       "Hava Durumu",
                       style: TextStyle(color: Colors.black),
                     ),
                     onTap: ()
                     {
                      Navigator.push(context, MaterialPageRoute(builder: (c)=> const HavaDurumu()));

                     },
                   ),

                   ListTile(
                     leading: const Icon(Icons.timer, color: Colors.black,),
                     title: const Text(
                       "Bitki Sulama",
                       style: TextStyle(color: Colors.black),
                     ),
                     onTap: ()
                     {
                      Navigator.push(context, MaterialPageRoute(builder: (c)=> TimerPage()));

                     },
                   ),

               //  ListTile(
               //    leading: const Icon(Icons.reorder, color: Colors.black,),
               //    title: const Text(
               //      "New Orders",
               //      style: TextStyle(color: Colors.black),
               //    ),
               //    onTap: ()
               //    {

               //    },
               //  ),

               //  const Divider(
               //    height: 0,
               //    color: Colors.grey,

               //    ),
                   ListTile(
                     leading: const Icon(Icons.exit_to_app, color: Colors.black,),
                     title: const Text(
                       "Çıkış Yap",
                       style: TextStyle(color: Colors.black),
                     ),
                     onTap: ()
                     {
                       fAuth.signOut().then((value){
                         Navigator.push(context, MaterialPageRoute(builder: (c)=> const SignInScreen()));
                       });
                     },
                   ),

                 ],


            ),
          ),
        ],
      ),
    );
  }
}

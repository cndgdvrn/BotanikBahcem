import 'package:botanik_bahcem/features/itemsScreen.dart';
import 'package:botanik_bahcem/features/splash/splash_screen.dart';
import 'package:botanik_bahcem/features/home/presentation/widgets/my_drawer.dart';
import 'package:botanik_bahcem/features/upload_topic/data/models/person_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../../../../core/global/global.dart';
import '../../../login/presentation/pages/login_page.dart';
import '../../../upload_topic/data/models/menus_model.dart';
import '../../../upload_topic/presentation/pages/menus_upload_screen.dart';
import '../../../upload_topic/presentation/widgets/card_design_widget.dart';
import '../../../upload_topic/presentation/widgets/person_design_widget.dart';
import '../../../upload_topic/presentation/widgets/progress_bar.dart';
import '../widgets/drawer.dart';
import '../widgets/theme_modal.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List symptoms = [
    "Domates",
    "Fesleğen",
    "Gül",
    "Lale",
    "Biber",
    "Nergiz",
    "Karpuz",
    "Kabak",
  ];
  List img = [
    "d1.jpg",
    "d2.jpg",
    "d3.jpg",
    "d4.jpg",
    "d5.jpg",
    "d6.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModal themeNotifier, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Botanik Bahçem'),
          actions: [
            Switch(
              value: themeNotifier.isDark ? false : true,
              onChanged: (value) {
                themeNotifier.isDark
                    ? themeNotifier.isDark = false
                    : themeNotifier.isDark = true;
              },
              activeColor: Colors.white,
            ),
          ],
        ),
        drawer: const MyDrawer(),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MenusUploadScreen(),
                          ));
                    },
                    child: Container(
                      padding: const EdgeInsets.only(
                          right: 20, left: 20, bottom: 20, top: 20),
                      decoration: BoxDecoration(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                spreadRadius: 4)
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.add,
                              size: 35,
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.6),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            'Bahçeni Paylaş',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: 18),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Sorunlarını Yaz',
                            style: TextStyle(
                              color: Colors.white54,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      fAuth.signOut();
                      Navigator.pop(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (c) => SignInScreen()));
                    },
                    child: Container(
                      padding: const EdgeInsets.only(
                          right: 20, left: 20, bottom: 20, top: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                spreadRadius: 4)
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.home_filled,
                              size: 35,
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.6),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Forumlara Gözat',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).primaryColor,
                                fontSize: 18),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Deneyimler Keşfet',
                            style: TextStyle(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.5),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (c) => const ItemsScreen()));
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'Bahçenizde Görmek İstedikleriniz',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 55,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: symptoms.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        decoration: BoxDecoration(
                            color: Colors.white60,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 4,
                                  spreadRadius: 2,
                                  color: Colors.black12),
                            ]),
                        child: Center(
                            child: Text(
                          symptoms[index],
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.black54),
                        )),
                      );
                    }),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    'Bahçenizde Görmek İstedikleriniz',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54),
                  ),
                ),
              ),
              SizedBox(
                height: 250,
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("sellers")
                        .doc(sharedPreferences!.getString('uid'))
                        .collection("menus")
                        .orderBy("publishedDate", descending: true)
                        .snapshots(),
                    builder: (context, snapshot) {
                      return !snapshot.hasData
                          ? Padding(
                              padding: EdgeInsets.all(0),
                              child: linearProgress(),
                            )
                          : Container(
                              padding: EdgeInsets.only(top: 15, bottom: 40),
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true, //important
                                  physics: BouncingScrollPhysics(),
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    Menus model = Menus.fromJson(
                                        snapshot.data!.docs[index].data());
                                    return CardDesignWidget(
                                      model: model,
                                      context: context,
                                    );
                                  }),
                            );
                    }),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    'Popüler Kullanıcılar',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54),
                  ),
                ),
              ),
              StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("sellers")
                        .orderBy("sellerUID", descending: true)
                        .snapshots(),
                    builder: (context, snapshot) {
                      return !snapshot.hasData
                          ? Padding(
                              padding: EdgeInsets.all(0),
                              child: linearProgress(),
                            )
                          : Container(
                              padding: EdgeInsets.only(top: 15, bottom: 40),
                              width: MediaQuery.of(context).size.width,
                              child: GridView.builder(
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,),
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true, //important
                                  physics: BouncingScrollPhysics(),
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    Person model = Person.fromJson(
                                        snapshot.data!.docs[index].data());
                                    return PersonDesignWidget(
                                      model: model,
                                      context: context,
                                    );
                                  }),
                            );
                    }),
            ],
          ),
        ),
      );
    });
  }
}

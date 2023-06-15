import 'package:botanik_bahcem/features/upload_topic/data/models/items_model.dart';
import 'package:botanik_bahcem/features/upload_topic/data/models/menus_model.dart';
import 'package:botanik_bahcem/features/upload_topic/presentation/pages/items_upload_screen.dart';
import 'package:botanik_bahcem/features/upload_topic/presentation/widgets/items_card_design.dart';
import 'package:botanik_bahcem/features/upload_topic/presentation/widgets/progress_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../core/global/global.dart';
import 'home/presentation/widgets/my_drawer.dart';

class ItemsScreen extends StatefulWidget {
  final Menus? model;
  const ItemsScreen({super.key, this.model});

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(),
        ),
        title: Text(
          sharedPreferences!.getString("name") ?? 'Null',
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ItemsUploadScreen(model: widget.model),
                  ),
                );
              },
              icon: const Icon(Icons.add))
        ],
      ),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(widget.model!.thumbnailUrl!),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Text(
                widget.model!.menuTitle.toString(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ), //textAlign: TextAlign.start,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 30, top: 20),
              child: Text(
                widget.model!.menuInfo.toString(),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ), //textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("sellers")
                      .doc(sharedPreferences!.getString('uid'))
                      .collection("menus")
                      .doc(widget.model!.menuID)
                      .collection("items")
                      .snapshots(),
                  builder: (context, snapshot) {
                    return !snapshot.hasData
                        ? Padding(
                            padding: EdgeInsets.all(0),
                            child: circularProgress(),
                          )
                        : Container(
                            padding: EdgeInsets.only(top: 15, bottom: 40),
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                                shrinkWrap: true, //important
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, index) {
                                  Items model = Items.fromJson(
                                      snapshot.data!.docs[index].data());
                                  return ItemsCardDesign(
                                    model: model,
                                    context: context,
                                  );
                                }),
                          );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

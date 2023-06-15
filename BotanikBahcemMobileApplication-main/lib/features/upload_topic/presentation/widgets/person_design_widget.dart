import 'package:botanik_bahcem/features/upload_topic/data/models/person_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../itemsScreen.dart';
import '../../../personScreen.dart';
import '../../data/models/menus_model.dart';

class PersonDesignWidget extends StatefulWidget {
  Person? model;
  BuildContext? context;

  PersonDesignWidget({this.model, this.context});

  @override
  _PersonDesignWidgetState createState() => _PersonDesignWidgetState();
}

class _PersonDesignWidgetState extends State<PersonDesignWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              spreadRadius: 2,
            ),
          ],
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.4,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PersonScreen(model: widget.model)));
            },
            child: Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              spreadRadius: 2,
                            )
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: NetworkImage(
                                widget.model!.sellerAvatarUrl!),
                          ),
                          Text(
                            widget.model!.sellerName!,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54,
                            ),
                          ),
                           Text(
                            widget.model!.sellerEmail!,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: Colors.black54,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              RatingBar.builder(
                                initialRating: 3,
                                minRating: 1,
                                itemSize: 20,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 1.0),
                                itemBuilder: (context, index) {
                                  switch (index) {
                                    case 0:
                                      return const Icon(
                                        Icons.sentiment_very_dissatisfied_sharp,
                                        color: Colors.red,
                                      );
                                    case 1:
                                      return const Icon(
                                        Icons.sentiment_dissatisfied,
                                        color: Colors.redAccent,
                                      );
                                    case 2:
                                      return const Icon(
                                        Icons.sentiment_neutral_outlined,
                                        color: Colors.amber,
                                      );
                                    case 3:
                                      return const Icon(
                                        Icons.sentiment_satisfied_alt,
                                        color: Colors.lightGreen,
                                      );
                                    case 4:
                                      return const Icon(
                                        Icons.sentiment_very_satisfied,
                                        color: Colors.green,
                                      );
                                  }
                                  return Container();
                                },
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
          ),
        ),
      ),
    );
  }
}

import 'package:cooking_app/models/recipe.dart';
import 'package:cooking_app/models/user.dart';
import 'package:cooking_app/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FollowsCards extends StatelessWidget {
  final Follows newfollows;

  FollowsCards({Key key, this.newfollows});
  @override
  Widget build(BuildContext context) {
    print(newfollows.name.toString());
    final user = Provider.of<User>(context);

    return StreamBuilder<FollowsData>(
        stream: DatabaseService(uid: user.uid).followsData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
          } else {}
          return Container(
            height: 90,
            width: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(newfollows.image),
                ),
                Text(
                  newfollows.name,
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          );
        });
  }
}

import 'package:cooking_app/models/recipe.dart';
import 'package:cooking_app/widgets/follows_cards.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FollowsHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newfollows = Provider.of<List<Follows>>(context);

    return ListView.builder(
      itemCount: newfollows.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return FollowsCards(newfollows: newfollows[index]);
      },
    );
  }
}

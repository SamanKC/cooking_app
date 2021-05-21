import 'package:cooking_app/models/recipe.dart';
import 'package:cooking_app/widgets/recipecard.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class RecommendedRecepies extends StatefulWidget {
  @override
  _RecommendedRecepiesState createState() => _RecommendedRecepiesState();
}

class _RecommendedRecepiesState extends State<RecommendedRecepies> {
  @override
  Widget build(BuildContext context) {
    final recipe = Provider.of<List<Recipe>>(context);
    if (recipe == null) {
      print(recipe.toString());
    }
    // recipe.forEach((recipe) {
    //   print(recipe.title);
    //   print(recipe.time);
    //   print(recipe.serving);
    //   print(recipe.image);
    // });

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: recipe.length,
      itemBuilder: (context, index) {
        return RecipeCard(recipies: recipe[index]);
      },
    );
    // return StreamProvider<QuerySnapshot>.value(
    //   stream: DatabaseService().reciperecommend,
    //   child:  ListView(
    //         children: [
    //           Stack(
    //             children: [
    //               Card(
    //                 clipBehavior: Clip.antiAliasWithSaveLayer,
    //                 child: Image.network(
    //                   'https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    //                 ),
    //                 shape: RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.circular(20.0),
    //                 ),
    //               ),
    //               Container(
    //                 width: 100,
    //                 margin: EdgeInsets.only(top: 90, left: 20, right: 20),
    //                 child: Text(
    //                   data[title],
    //                   style: TextStyle(
    //                       color: Colors.white,
    //                       fontSize: 14,
    //                       fontWeight: FontWeight.bold),
    //                 ),
    //               ),
    //               Container(
    //                 margin: EdgeInsets.only(top: 150, left: 20, right: 20),
    //                 height: 10,
    //                 width: 100,
    //                 child: Row(
    //                   children: [
    //                     Text(
    //                       data[time],
    //                       style: TextStyle(
    //                           color: Colors.grey,
    //                           fontSize: 8,
    //                           fontWeight: FontWeight.bold),
    //                     ),
    //                     VerticalDivider(
    //                       color: Colors.white,
    //                     ),
    //                     Text(
    //                       data[servings],
    //                       style: TextStyle(
    //                           color: Colors.grey,
    //                           fontSize: 8,
    //                           fontWeight: FontWeight.bold),
    //                     ),
    //                   ],
    //                 ),
    //               )
    //             ],
    //           )
    //         ],
    //       );
    // );
  }
}

import 'package:cooking_app/models/recipe.dart';
import 'package:cooking_app/widgets/newrecipe_card.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class NewRecepies extends StatefulWidget {
  @override
  _NewRecepiesState createState() => _NewRecepiesState();
}

class _NewRecepiesState extends State<NewRecepies> {
  final newrecipe = [];
  @override
  Widget build(BuildContext context) {
    final newrecipe = Provider.of<List<NewRecipe>>(context);
  

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: newrecipe.length,
      itemBuilder: (context, index) {
        return NewRecipeCard(newrecipies: newrecipe[index]);
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

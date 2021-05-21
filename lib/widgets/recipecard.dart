import 'package:cooking_app/Provider/all_provider.dart';
import 'package:cooking_app/Provider/app_provider.dart';
import 'package:cooking_app/models/recipe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipies;

  RecipeCard({this.recipies});
  @override
  Widget build(BuildContext context) {
    // AppProvider appProvider = Provider.of<AppProvider>(context);
    var providerdata = Provider.of<FoodData>(context);

    return Stack(
      children: [
        Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          // child: Image.network(
          //   'https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
          // ),
          child: Image.network(recipies.image),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        Container(
          width: 100,
          margin: EdgeInsets.only(top: 90, left: 20, right: 20),
          child: Text(
            recipies.title,
            style: TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 150, left: 20, right: 20),
          height: 10,
          width: 100,
          child: Row(
            children: [
              Text(
                recipies.time,
                // providerdata.featureProducts.map((e) => e.price).toString(),
                // providerdata.featureProducts.map((e) => e.time).toString(),
                // providerdata.featureProducts.length.toString()
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 8,
                    fontWeight: FontWeight.bold),
              ),
              VerticalDivider(
                color: Colors.white,
              ),
              Text(
                recipies.serving,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 8,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )
      ],
    );
  }
}

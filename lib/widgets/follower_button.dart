import 'package:cooking_app/models/recipe.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FollowerButtonCard extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    final newfollows = Provider.of<List<Follows>>(context);
    

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.all(10),
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    CircleAvatar(
                        radius: 15,
                        backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                        )
                        // newfollows.image),
                        ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Karen Watson",
                          // newfollows.,
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          "Professional Chef",
                          // newfollows.subname,
                          style: TextStyle(fontSize: 10, color: Colors.grey),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              ButtonTheme(
                height: 30,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Color(0xFF1f1e26),
                  onPressed: () {},
                  child: Text(
                    "Follow",
                    style: TextStyle(color: Colors.yellow[700], fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

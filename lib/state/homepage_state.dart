// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class AddRecipe extends StatelessWidget {
//   final String title;
//   final String time;
//   final String servings;
//   final String image;

//   const AddRecipe({Key key, this.title, this.time, this.servings, this.image})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     CollectionReference users =
//         FirebaseFirestore.instance.collection('RecommendedRecipies');

//     return FutureBuilder<DocumentSnapshot>(
//       future: users.doc(title).get(),
      
//       builder:
//           (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

//         if (snapshot.hasError) {
//           return Text("Something went wrong");
//         }

//         if (snapshot.connectionState == ConnectionState.done) {
//           Map<String, dynamic> data = snapshot.data.data();
//           return Text("Full Name: ${data['full_name']} ${data['last_name']}");
//         }

//         return Text("loading");
//       },
//     );
//   }
// }

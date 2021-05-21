import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_app/models/recipe.dart';
import 'package:cooking_app/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference recommendedRecipies =
      Firestore.instance.collection('recommendedrecipe');
  final CollectionReference newRecipe =
      Firestore.instance.collection('newrecipe');
  final CollectionReference follows = Firestore.instance.collection('follows');

  Future updateUserData(
      String title,
      String time,
      String serving,
      String image,
      String imagea,
      String imageb,
      double price,
      String rating,
      String subname,
      String name) async {
    return await recommendedRecipies.document(uid).setData({
      'title': title,
      'time': time,
      'serving': serving,
      'image': image,
      'imagea': imagea,
      'imageb': imageb,
      'price': price,
      'rating': rating,
      'subname': subname,
      'name': name,
    });
  }

  // recommended recipies list from snapshot
  List<Recipe> _recommendrecipe(QuerySnapshot snapshot) {
    return snapshot.documents.map((e) {
      return Recipe(
        title: e.data['title'] ?? '',
        time: e.data['time'] ?? '',
        serving: e.data['serving'] ?? '',
        image: e.data['image'] ?? '',
        imagea: e.data['imagea'] ?? '',
        imageb: e.data['imageb'] ?? '',
        price: e.data['price'] ?? '',
        rating: e.data['rating'] ?? '',
        subname: e.data['subname'] ?? '',
        name: e.data['name'] ?? '',
      );
    }).toList();
  }

  //get recommended recipies stream
  Stream<List<Recipe>> get reciperecommend {
    return recommendedRecipies.snapshots().map(_recommendrecipe);
  }

  Future updateNewRecipeData(
      String title, String time, String serving, String image) async {
    return await newRecipe.document(uid).setData({
      'title': title,
      'time': time,
      'serving': serving,
      'image': image,
    });
  }

  // follows list from snapshot
  List<NewRecipe> _newRecipe(QuerySnapshot snapshot) {
    return snapshot.documents.map((e) {
      return NewRecipe(
        title: e.data['title'] ?? '',
        time: e.data['time'] ?? '',
        serving: e.data['serving'] ?? '',
        image: e.data['image'] ?? '',
      );
    }).toList();
  }

  //get recommended recipies stream
  Stream<List<NewRecipe>> get newrecipe {
    return newRecipe.snapshots().map(_newRecipe);
  }

  //follows
  Future updateFollowsData(String image, String name, String subname) async {
    return await follows.document(uid).setData({
      'image': image,
      'name': name,
      'subname': subname,
    });
  }

  // follows list from snapshot
  List<Follows> _follows(QuerySnapshot snapshot) {
    return snapshot.documents.map((e) {
      return Follows(
        image: e.data['image'] ?? '',
        name: e.data['name'] ?? '',
        subname: e.data['subname'] ?? '',
      );
    }).toList();
  }

  //get follows recipies stream
  Stream<List<Follows>> get newfollows {
    return follows.snapshots().map(_follows);
  }

  //followsdata from snapshot
  FollowsData _followsDataFromSnapshot(DocumentSnapshot snapshot) {
    return FollowsData(
      uid: uid,
      image: snapshot.data['image'],
      name: snapshot.data['name'],
    );
  }

  //get follows doc stream
  Stream<FollowsData> get followsData {
    return follows.document(uid).snapshots().map(
          (_followsDataFromSnapshot),
        );
  }
}

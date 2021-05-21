import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  static const ID = 'id';
  static const TITLE = 'title';
  static const IMAGE = 'image';
  static const IMAGEA = 'imagea';
  static const IMAGEB = 'imageb';
  static const SERVING = 'serving';
  static const TIME = 'time';
  static const RATING = 'rating';
  static const NAME = 'name';
  static const SUBNAME = 'subname';
  static const PRICE = 'price';

  String _id;
  String _title;
  String _image;
  String _imagea;
  String _imageb;
  String _serving;
  String _time;
  String _rating;
  String _name;
  String _subname;
  double _price;

  String get id => _id;
  String get title => _title;
  String get image => _image;
  String get imagea => _imagea;
  String get imageb => _imageb;
  String get serving => _serving;
  String get time => _time;
  String get rating => _rating;
  String get name => _name;
  String get subname => _subname;
  double get price => _price;

  //name constructor
  Product.fromSnapshot(DocumentSnapshot snapshot) {
    Map data = snapshot.data;
    _id = data[ID];
    _title = data[TITLE];
    _image = data[IMAGE];
    _imagea = data[IMAGEA];
    _imageb = data[IMAGEB];
    _serving = data[SERVING];
    _time = data[TIME];
    _rating = data[RATING];
    _name = data[NAME];
    _subname = data[SUBNAME];
    _price = data[PRICE];
  }
}

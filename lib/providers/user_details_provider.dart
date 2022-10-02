
import 'package:amazoon_clone/model/user_details_model.dart';
import 'package:amazoon_clone/resources/cloundfirestore_method.dart';
import 'package:flutter/material.dart';

class UserDetailsprovider with ChangeNotifier {
  UserDetailsModel userDetails;

  UserDetailsprovider() : userDetails = UserDetailsModel(
      name: 'Loading', address: 'Loading');

  Future getData() async {
    userDetails = await CloundFirestoreClass().getNameAndAddress();
    notifyListeners();
  }

}
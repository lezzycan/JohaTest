import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  //final File image;
  final String firstName;
  final String lastName;
  final String country;
  final String state;
  final String address;
  final String dob;
  final String gender;

  final String email;
  final String phoneNo;

  final String city;

  UserModel(
      {required this.firstName,
      required this.lastName,
      required this.country,
      required this.state,
      required this.address,
      required this.dob,
      required this.gender,
      this.id,
      // required this.image,
      required this.email,
      required this.phoneNo,
      required this.city});

  toJson() {
    return {
      "FirstName": firstName,
      "Lastname": lastName,
      "Country": country,
      "DOB": dob,
      "Gender": gender,
      "Email": email,
      "Phone": phoneNo,
      "State": state,
      //"Image": image,
      "Address": address,
      "City": city
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    final data = documentSnapshot.data();
    return UserModel(
      id: documentSnapshot.id,
      firstName: data!["FirstName"],
      lastName: data["Lastname"],
      country: data["Country"],
      state: data["State"],
      address: data["Address"],
      dob: data["DOB"],
      gender: data["Gender"],
      email: data["Email"],
      phoneNo: data["Phone"],
      city: data["City"],
    );
  }
}

import 'package:appscrip/core/colors/colors.dart';
import 'package:appscrip/core/constants.dart';
import 'package:appscrip/presentation/home/widgets/user_detail_card.dart';
import 'package:flutter/material.dart';

class CustomerDetails extends StatelessWidget {
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;
  final String address;
  const CustomerDetails(
      {super.key,
      required this.name,
      required this.phone,
      required this.username,
      required this.email,
      required this.website,
      required this.address});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name.toUpperCase(),
          style: const TextStyle(fontSize: 22, color: kgreen),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: kwhiteColor,
                radius: 100,
                child: Icon(
                  Icons.person,
                  size: 150,
                  color: kgreen,
                ),
              ),
              kHeight,
              Detailcard(
                  size: size,
                  name: name,
                  phone: phone,
                  email: email,
                  username: username,
                  website: website,
                  address: address),
            ],
          )),
    );
  }
}

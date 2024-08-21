import 'package:appscrip/core/colors/colors.dart';
import 'package:flutter/material.dart';

class Detailcard extends StatelessWidget {
  const Detailcard({
    super.key,
    required this.size,
    required this.name,
    required this.phone,
    required this.email,
    required this.username,
    required this.website,
    required this.address,
  });

  final Size size;
  final String name;
  final String phone;
  final String email;
  final String username;
  final String website;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
            color: Colors.green[50], borderRadius: BorderRadius.circular(20)),
        height: 200,
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                overflow: TextOverflow.ellipsis,
                name.toUpperCase(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 22, color: kgreen),
              ),
              Text('Phone: ${phone}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.grey[800])),
              Text(
                'email: ${email}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.grey[800]),
              ),
              Text(
                'username: ${username}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.grey[800]),
              ),
              Text(
                'website: ${website}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.grey[800]),
              ),
              Text(
                overflow: TextOverflow.ellipsis,
                'Address: ${address}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.grey[800]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:appscrip/core/colors/colors.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final String name;
  final String email;
  final String index;
  final VoidCallback onTap;
  const UserCard({
    super.key,
    required this.name,
    required this.email,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Card(
        child: ListTile(
          onTap: onTap,
          leading: CircleAvatar(
            backgroundColor: kwhiteColor,
            child: Text(
              index,
              style: const TextStyle(fontSize: 22, color: kgreen),
            ),
          ),
          title: Text(
            name,
            style: const TextStyle(fontSize: 22),
          ),
          subtitle: Text(
            email,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}

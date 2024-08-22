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
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Card(
        color: theme.cardColor,
        child: ListTile(
          onTap: onTap,
          leading: CircleAvatar(
            radius: 40,
            backgroundColor: kwhiteColor,
            child: Icon(
              Icons.person,
              size: 45,
              color: kgreen,
            ),
          ),
          title: Text(
            name,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontSize: 20,
              color: theme.textTheme.bodyMedium?.color,
            ),
          ),
          subtitle: Text(
            email,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontSize: 18,
              color: theme.textTheme.bodyMedium?.color,
            ),
          ),
        ),
      ),
    );
  }
}

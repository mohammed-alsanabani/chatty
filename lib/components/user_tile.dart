import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  const UserTile({super.key, required this.text, required this.onTap});

  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(12),
          ),
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Icon(Icons.person, color: Theme.of(context).colorScheme.primary),
              SizedBox(width: 12),
              Text(
                text,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

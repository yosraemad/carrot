import 'package:flutter/material.dart';

typedef TapFunction = void Function()?;

class ProfileTile extends StatelessWidget {
  const ProfileTile(
      {super.key,
      required this.icon,
      required this.text,
      this.trailing,
      this.onTap});

  final IconData icon;
  final String text;
  final Widget? trailing;
  final TapFunction onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        horizontalTitleGap: 1,
        contentPadding: EdgeInsets.zero,
        leading: Icon(
          icon,
          size: 30,
        ),
        title: Text(
          text,
          style: const TextStyle(
            color: Color(0xff828282),
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        trailing: trailing ??
            const Icon(
              Icons.chevron_right,
              size: 30,
            ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

typedef TapFunction = void Function()?;

class ProfileTile extends StatelessWidget {
  const ProfileTile(
      {key, required this.icon, required this.text, this.trailing, this.onTap})
      : super(key: key);

  final Widget icon;
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
        leading: icon,
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

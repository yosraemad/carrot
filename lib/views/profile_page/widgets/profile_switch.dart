import 'package:carrot_app/resources/app_doubles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

/// A dummy switch for the Notifications switch in the [ProfileScreen]
class ProfileSwitch extends StatefulWidget {
  const ProfileSwitch({key}) : super(key: key);

  @override
  State<ProfileSwitch> createState() => _ProfileSwitchState();
}

class _ProfileSwitchState extends State<ProfileSwitch> {
  bool state = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDoubles.switchWidth,
      height: AppDoubles.switchHeight,
      child: FlutterSwitch(
        width: AppDoubles.switchWidth,
        height: AppDoubles.switchHeight,
        activeColor: Theme.of(context).primaryColor,
        value: state,
        padding: AppDoubles.switchPadding,
        onToggle: (value) {
          setState(() {
            state = value;
          });
        },
      ),
    );
  }
}

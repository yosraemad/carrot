import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
      width: 44,
      height: 28,
      child: FlutterSwitch(
        width: 44,
        height: 28,
        activeColor: Theme.of(context).primaryColor,
        value: state,
        padding: 2,
        onToggle: (value) {
          setState(() {
            state = value;
          });
        },
      ),
    );
  }
}

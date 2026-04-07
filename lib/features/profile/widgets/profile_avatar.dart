import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 55,
      backgroundImage: AssetImage('assets/images/avatar/profile_avatar.jpg'),
    );
  }
}

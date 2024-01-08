import 'package:crossdress/colos.dart';
import 'package:flutter/material.dart';

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {

    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colored.pink.withOpacity(0.1),
        ),
        child: Icon(icon, color: Colored.brightPurple),
      ),
      title: Text(title, style: Theme.of(context).textTheme.bodyText1?.apply(color: textColor)),
      trailing: endIcon? const Icon(Icons.arrow_forward_ios, size: 18.0, color: Colors.grey) : null,
    );
  }
}
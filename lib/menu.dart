import 'package:flutter/material.dart';

class MenuList extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;

// menu list contents
// key, icon, title & onTap
  const MenuList({Key key, this.icon, this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: Colors.cyan,
              size: 28,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 22,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

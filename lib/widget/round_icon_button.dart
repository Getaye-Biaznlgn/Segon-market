import 'package:flutter/material.dart';
class RoundIconButton extends StatelessWidget {
  final IconData iconData;
   Function onPressed;
   RoundIconButton({@required this.iconData, @required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(iconData, color: Colors.white,),
      onPressed: onPressed,
      elevation: 0,
      constraints:  BoxConstraints.tightFor(width: 50.0, height: 50.0),
      shape: CircleBorder(),
      fillColor: Theme.of(context).accentColor,
    );
  }
}

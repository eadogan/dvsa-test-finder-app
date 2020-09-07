import 'package:flutter/material.dart';
import 'package:dvsa_app/components/text_field_container.dart';
import 'package:dvsa_app/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final String labelText;
  // final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.labelText,
    // this.icon,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          // icon: Icon(
          //   icon,
          //   color: Colors.black,
          // ),
          labelText: labelText,
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

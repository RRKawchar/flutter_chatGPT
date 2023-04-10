import 'package:flutter/material.dart';
import 'package:flutter_chat_gpt/constants/constants.dart';

class ModelsDropDownWidget extends StatefulWidget {
  const ModelsDropDownWidget({Key? key}) : super(key: key);

  @override
  State<ModelsDropDownWidget> createState() => _ModelsDropDownWidgetState();
}

class _ModelsDropDownWidgetState extends State<ModelsDropDownWidget> {

  String currentModels='Models1';
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      dropdownColor: scaffoldBackgroundColor,
      iconEnabledColor: Colors.white,
      value: currentModels,
      items:getModelItem,
      onChanged: (value) {
        setState(() {
          currentModels=value.toString();
        });
      },
    );
  }
}

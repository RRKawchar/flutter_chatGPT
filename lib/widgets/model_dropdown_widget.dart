import 'package:flutter/material.dart';
import 'package:flutter_chat_gpt/constants/constants.dart';
import 'package:flutter_chat_gpt/models/models_model.dart';
import 'package:flutter_chat_gpt/services/api_service.dart';
import 'package:flutter_chat_gpt/widgets/text_widget.dart';

class ModelsDropDownWidget extends StatefulWidget {
  const ModelsDropDownWidget({Key? key}) : super(key: key);

  @override
  State<ModelsDropDownWidget> createState() => _ModelsDropDownWidgetState();
}

class _ModelsDropDownWidgetState extends State<ModelsDropDownWidget> {
  String currentModels = 'code-davinci-edit-001';
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ModelsModel>>(
        future: ApiService.getModel(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: TextWidget(label: snapshot.error.toString()),
            );
          }
          return snapshot.data == null || snapshot.data!.isEmpty
              ? const SizedBox.shrink()
              : FittedBox(
                child: DropdownButton(
                    dropdownColor: scaffoldBackgroundColor,
                    iconEnabledColor: Colors.white,
                    value: currentModels,
                    items: List<DropdownMenuItem<String>>.generate(
                      snapshot.data!.length,
                          (index) => DropdownMenuItem(
                        value: snapshot.data![index].id,
                        child: TextWidget(
                          label: snapshot.data![index].id,
                          fonSize: 15,
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        currentModels = value.toString();
                      });
                    },
                  ),
              );
        });
  }
}
/*
* DropdownButton(
      dropdownColor: scaffoldBackgroundColor,
      iconEnabledColor: Colors.white,
      value: currentModels,
      items:getModelItem,
      onChanged: (value) {
        setState(() {
          currentModels=value.toString();
        });
      },
    );*/

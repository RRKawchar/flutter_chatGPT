import 'package:flutter/material.dart';
import 'package:flutter_chat_gpt/constants/constants.dart';
import 'package:flutter_chat_gpt/widgets/model_dropdown_widget.dart';
import 'package:flutter_chat_gpt/widgets/text_widget.dart';

class Services{

  static Future<void> showModelSheet({required BuildContext context})async{

    await showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(20)
            )
        ),
        backgroundColor: scaffoldBackgroundColor,
        context: context, builder: (context){
      return Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:   const [
            Flexible(child: TextWidget(label: 'Chosen Model',fonSize: 16,) ,),
            Flexible(
                flex: 2,
                child: ModelsDropDownWidget())
          ],
        ),
      );
    });

  }
}
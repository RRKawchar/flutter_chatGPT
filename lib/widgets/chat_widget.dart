import 'package:flutter/material.dart';
import 'package:flutter_chat_gpt/constants/constants.dart';
import 'package:flutter_chat_gpt/services/asset_manager.dart';
import 'package:flutter_chat_gpt/widgets/text_widget.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({Key? key, required this.msg, required this.index})
      : super(key: key);
  final String msg;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: index == 0 ? scaffoldBackgroundColor : cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  index == 0 ? AssetManager.userImage : AssetManager.chatImage,
                  height: 30,
                  width: 30,
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(child: TextWidget(label: msg)),
                index == 0
                    ? const SizedBox.shrink()
                    : Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                           Icon(
                             Icons.thumb_up_alt_outlined,color: Colors.white,
                           ),
                          SizedBox(width: 5,),
                          Icon(Icons.thumb_down_alt_outlined,color: Colors.white,)

                        ],
                      )
              ],
            ),
          ),
        )
      ],
    );
  }
}

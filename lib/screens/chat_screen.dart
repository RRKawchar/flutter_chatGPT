import 'package:flutter/material.dart';
import 'package:flutter_chat_gpt/constants/constants.dart';
import 'package:flutter_chat_gpt/services/asset_manager.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final bool _isTyping = true;
  late TextEditingController textEditingController;
  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AssetManager.openAiLogo),
        ),
        title: const Text("ChatGPT"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.more_rounded,color: Colors.white,))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return const Text("Hello this is a text");
                  }),
            ),
            if (_isTyping) ...[
              const SpinKitThreeBounce(
                color: Colors.white,
                size: 18.0,
              ),
              const SizedBox(height: 15,),
              Material(
                color: cardColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: TextField(
                            style: const TextStyle(color: Colors.white),
                        controller: textEditingController,
                        onSubmitted: (value) {},
                        decoration: const InputDecoration.collapsed(
                          hintText: 'How can I help you?',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),),
                      IconButton(onPressed: (){}, icon: const Icon(Icons.send,color: Colors.white,))
                    ],
                  ),
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}

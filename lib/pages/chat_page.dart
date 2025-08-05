import 'package:chatty/components/chat_bubble.dart';
import 'package:chatty/components/text_form_field.dart';
import 'package:chatty/services/auth/auth_service.dart';
import 'package:chatty/services/chat/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.reciverEmail, required this.reciverID});

  final String reciverEmail;
  final String reciverID;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();

  // chat & auth services
  final ChatService _chatService = ChatService();

  final AuthService _authService = AuthService();

  // for TextField focused
  FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    // add listener to focus node
    myFocusNode.addListener(() {
      if (myFocusNode.hasFocus) {
        // cuz a delay so that keybords has limit to show
        // the the amount of remainig space will be calc
        // then scroll down
        Future.delayed(const Duration(microseconds: 500), () => scrollDown());
      }
    });

    // wait a bit for listView to be built, then scroll to buttom
    Future.delayed(const Duration(microseconds: 500), () => scrollDown());
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    _messageController.dispose();
    super.dispose();
  }

  // Scroller controll
  final ScrollController _scrollController = ScrollController();
  void scrollDown() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  // sendMessage
  void sendMessage() async {
    // if there is something in text field
    if (_messageController.text.isNotEmpty) {
      // send a message
      await _chatService.sendMessage(widget.reciverID, _messageController.text);

      // clearing
      _messageController.clear();
    }
    scrollDown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text(widget.reciverEmail),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
        //actions: [IconButton(onPressed: logOut, icon: Icon(Icons.logout))],
      ),
      body: Column(
        children: [
          // display all messages
          Expanded(child: _buildMessageList()),
          _buildUserInput(),
        ],
      ),
    );
  }

  // build a message list
  Widget _buildMessageList() {
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: _chatService.getMessage(widget.reciverID, senderID),
      builder: (context, snapshot) {
        // errors
        if (snapshot.hasError) {
          return Text('Error');
        }

        // loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text('loading');
        }

        // return list view
        return ListView(
          controller: _scrollController,
          children: snapshot.data!.docs
              .map((doc) => _buildMessageItem(doc))
              .toList(),
        );
      },
    );
  }

  // build a message item
  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    // is current user
    bool isCurrentUser = data['senderId'] == _authService.getCurrentUser()!.uid;

    // align message to the right if current user , otherwise align to the left
    var alignment = isCurrentUser
        ? Alignment.centerRight
        : Alignment.centerLeft;
    return Container(
      alignment: alignment,
      child: Column(
        crossAxisAlignment: isCurrentUser
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          ChatBubble(message: data['message'], isCurrentUser: isCurrentUser),
        ],
      ),
    );
  }

  // build a message input
  Widget _buildUserInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, bottom: 26),
              child: MyTextField(
                hintText: 'Type a message',
                controller: _messageController,
                obscureText: false,
                focusNode: myFocusNode,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            margin: EdgeInsets.only(right: 25),
            child: IconButton(
              onPressed: sendMessage,
              icon: Padding(
                padding: const EdgeInsets.only(right: 1.0, bottom: 26),
                child: const Icon(Icons.arrow_upward, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

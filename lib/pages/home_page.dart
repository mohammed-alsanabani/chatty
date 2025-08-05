import 'package:chatty/components/my_drawer.dart';
import 'package:chatty/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

import '../components/user_tile.dart';
import '../services/auth/auth_service.dart';
import 'chat_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  void logOut() {
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('Chatty Chatty'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
        //actions: [IconButton(onPressed: logOut, icon: Icon(Icons.logout))],
      ),
      drawer: MyDrawer(),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUserStream(),
      builder: (context, snapshot) {
        // error
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        // loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        // return list of users
        return ListView(
          children: snapshot.data!
              .map<Widget>((userData) => _buildUserListItem(userData, context))
              .toList(),
        );
      },
    );
  }

  Widget _buildUserListItem(
    Map<String, dynamic> userData,
    BuildContext context,
  ) {
    // display all users except current user
    if (userData['email'] != _authService.getCurrentUser()!.email) {
      return UserTile(
        text: userData['email'],
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                reciverEmail: userData['email'],
                reciverID: userData['uid'],
              ),
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }
}

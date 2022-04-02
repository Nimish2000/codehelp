import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minorproject/data/chats_json.dart';
import 'package:minorproject/matchesScreen.dart';
import 'package:minorproject/members_chat_screen.dart';
import 'personal_chat_screen.dart';
import 'personal_chat_screen.dart';

class chatScreen extends StatefulWidget {
  const chatScreen({Key? key}) : super(key: key);

  @override
  _chatScreenState createState() => _chatScreenState();
}

class _chatScreenState extends State<chatScreen> {
  var length = userMessages.length;
  var pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        toolbarHeight: 88.0,
        title: getAppBar(),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
        memberChatScreen(),
        matchesScreen(),
      ],
    );
  }

  Widget getAppBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 6.0, left: 0.0, right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FlatButton(
                  onPressed: () {
                    setState(() {
                      pageIndex = 0;
                    });
                  },
                  child: Text(
                    'Messages',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: (pageIndex == 0)
                            ? Color(0xFFFD5C61)
                            : Colors.black.withOpacity(0.15)),
                  ),
                ),
                Container(
                  height: 25.0,
                  width: 1.0,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.15),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    setState(() {
                      pageIndex = 1;
                    });
                  },
                  child: Text(
                    'Matches',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: (pageIndex == 1)
                          ? Color(0xFFFD5C61)
                          : Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Divider(
            thickness: 1.2,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:minorproject/data/chats_json.dart';
import 'dart:core';

class personalChatScreen extends StatefulWidget {
  const personalChatScreen({Key? key}) : super(key: key);

  @override
  _personalChatScreenState createState() => _personalChatScreenState();
}

class _personalChatScreenState extends State<personalChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: getBody(),
    );
  }

  Widget getBody() {
    return Column(
      children: [
        Container(
          height: 110.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 1.5,
                spreadRadius: 0.0,
                // offset: Offset(0.80, 0.80), // shadow direction: bottom right
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 28.0, left: 5.0, right: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  tooltip: 'back',
                  iconSize: 26.0,
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xFFFD5C61),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Column(
                    children: [
                      Container(
                        height: 45.0,
                        width: 65.0,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/girls/img_1.jpeg',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      Text(
                        'Ayo',
                        style: TextStyle(
                          color: Colors.black45,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    //Make user report to administration!!
                  },
                  tooltip: 'Report',
                  iconSize: 26.0,
                  icon: Icon(
                    Icons.flag,
                    color: Color(0xFFFD5C61),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView(
            reverse: true,
            children: List.generate(
              userMessages.length,
              (index) {
                return Column(
                  crossAxisAlignment: userMessages[index]['online']
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.end,
                  children: [
                    Material(
                      borderRadius: userMessages[index]['online']
                          ? BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0),
                              bottomRight: Radius.circular(30.0))
                          : BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0),
                              bottomLeft: Radius.circular(30.0),
                            ),
                      elevation: 2.0,
                      color: userMessages[index]['online']
                          ? Colors.white12
                          : Colors.lightBlueAccent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          userMessages[index]['message'],
                          style: TextStyle(
                            fontSize: 15.0,
                            color: userMessages[index]['online']
                                ? Colors.black54
                                : Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
          child: Container(
            height: 40.0,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(9.0),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    onSubmitted: (val) {},
                    cursorColor: Colors.black.withOpacity(0.5),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 10.0, bottom: 5.0),
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    print('Button is pressed !!');
                    //sent data to database...
                  },
                  child: Text(
                    'Send',
                    style: TextStyle(
                      color: Colors.grey.withOpacity(0.8),
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:minorproject/data/chats_json.dart';
import 'personal_chat_screen.dart';

class memberChatScreen extends StatefulWidget {
  const memberChatScreen({Key? key}) : super(key: key);

  @override
  _memberChatScreenState createState() => _memberChatScreenState();
}

class _memberChatScreenState extends State<memberChatScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 0.0, left: 8.0, right: 8.0),
          child: Container(
            height: 38.0,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: TextField(
              cursorColor: Colors.black.withOpacity(0.5),
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black.withOpacity(0.5),
                ),
                hintText: 'Search in 5 matches',
              ),
              onSubmitted: (val) {
                //Here we will search in given matches.
              },
            ),
          ),
        ),
        Divider(
          thickness: 0.8,
        ),
        SizedBox(
          height: 10.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                'Messages (2)',
                style: TextStyle(
                  color: Color(0xFFFD5C61),
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Column(
                children: List.generate(userMessages.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: FlatButton(
                      onPressed: () {
                        //Navigate to chat screen of particular person!!
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => personalChatScreen()));
                      },
                      padding: EdgeInsets.only(right: 4.0),
                      child: Row(
                        children: [
                          Container(
                            height: 70.0,
                            width: 70.0,
                            child: Stack(
                              children: [
                                Container(
                                  height: 65.0,
                                  width: 65.0,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(
                                        userMessages[index]['img'],
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                userMessages[index]['online']
                                    ? Positioned(
                                        top: 48.0,
                                        left: 52.0,
                                        child: Container(
                                          height: 20.0,
                                          width: 20.0,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.green,
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 3.0,
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                userMessages[index]['name'],
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width - 135.0,
                                child: Text(
                                  userMessages[index]['message'] +
                                      " - " +
                                      userMessages[index]['created_at'],
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.black.withOpacity(0.8),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

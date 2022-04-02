import 'package:flutter/material.dart';
import 'package:minorproject/data/chats_json.dart';
import 'personal_chat_screen.dart';

class matchesScreen extends StatefulWidget {
  const matchesScreen({Key? key}) : super(key: key);

  @override
  _matchesScreenState createState() => _matchesScreenState();
}

class _matchesScreenState extends State<matchesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: getBody(),
    );
  }

  Widget getBody() {
    return ListView(
      children: [
        SizedBox(
          height: 10.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                'Matches (2)',
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
                                  'Software Developer',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.black.withOpacity(0.8),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
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

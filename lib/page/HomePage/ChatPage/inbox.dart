
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tindev/models/Chats.dart';



class Inbox extends StatefulWidget {
  @override
  _InboxState createState() => new _InboxState();
}

class _InboxState extends State<Inbox> {
  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Huy", messageType: "receiver"),
    ChatMessage(messageContent: "Hello", messageType: "sender"),
    ChatMessage(messageContent: "What can i do for you?", messageType: "sender"),
    ChatMessage(messageContent: "Can you build a website in 3 days", messageType: "receiver"),
    ChatMessage(messageContent: "Oki, give me your requirement.", messageType: "sender"),
  ];

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[600],
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Text('FPT', style: TextStyle(fontSize: 10)),
              ),
              // Padding(
              //   padding: EdgeInsets.only(left: 10),
              //   child: Text('', style: TextStyle(fontSize: 14)),
              // ),
              // Padding(
              //   padding: EdgeInsets.only(left: 2, bottom: 5),
              //   child: Icon(
              //     EvilIcons.user,
              //     color: Colors.white,
              //   ),
              // ),
            ],
          ),
          actions: <Widget>[
            // Padding(
            //   padding:  EdgeInsets.only(right: 20.0),
            //   child: GestureDetector(
            //     onTap: (){},
            //     child: Icon(Ionicons.ios_videocam, size: 30.0),    
            //   ),
            // ),
            // Padding(
            //   padding:  EdgeInsets.only(right: 20.0),
            //   child: GestureDetector(
            //     onTap: (){},
            //     child: Icon(FontAwesome.phone, size: 30.0),    
            //   ),
            // ),
            Padding(
              padding:  EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: (){            
                },
                child: Icon(Icons.more_vert, size: 30.0),    
              ),
            )
          ],
        ),
        body: Stack(
          children: <Widget>[
            ListView.builder(
              itemCount: messages.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 10, bottom: 10),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.only(
                    left: 14.0,
                    right: 14,
                    top: 10,
                    bottom: 10.0
                  ),
                  child: Align(
                    alignment: (messages[index].messageType == "receiver" 
                    ? Alignment.topLeft
                    : Alignment.topRight),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: messages[index].messageType == "receiver" 
                        ? Colors.blue[600]: Colors.grey.shade200
                      ),
                        padding: EdgeInsets.all(16),
                        child: Text(messages[index].messageContent, style: TextStyle(
                          fontSize: 13,
                          color:  messages[index].messageType == "receiver"
                          ? Colors.white
                          : Colors.black87
                        ),
                        ),
                      )
                    ),
                );
              },
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.only(
                    left: 10,
                    top: 10,
                    bottom: 10.0
                ),
                height: 60,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.blue[600],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Icon(
                          Icons.add, 
                          color: Colors.white, 
                          size: 20
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(decoration: InputDecoration(
                        hintText: "Write a message...",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    FloatingActionButton(
                      onPressed: (){},
                      child:  Icon(
                        Icons.send, 
                        color: Colors.white, 
                        size: 18
                      ),
                      backgroundColor: Colors.blue[600],
                      elevation: 1,
                      )
                  ],
                ),
              ),  
            )
          ],
        ),
      ),
    );
  }
}
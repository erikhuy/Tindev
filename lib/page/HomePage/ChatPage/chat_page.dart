import 'package:flutter/material.dart';
import 'package:tindev/data/chats_company_json.dart';
import 'package:tindev/data/chats_dev_json.dart';
import 'package:tindev/page/HomePage/ChatPage/inbox.dart';
import 'package:tindev/theme/colors.dart';



class ChatPage extends StatefulWidget {
  final String role;
  ChatPage({Key key, @required this.role}) : super(key: key);
  
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  // Future<List<User>> _getUsers() async {
  //   var data = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
  //   var jsonData = json.decode(data.body);
  //   List<User> users = [];
  //   for (var u in jsonData) {
  //     User user = User(u["id"], u['name']);
  //     users.add(user);
  //   }
  //   return users;
  // }

  List chatTemp = [];
  List userTemp = [];
  @override
  void initState() {
    super.initState();
    setState(() {
      // print(widget.role);
      if (widget.role == "Company"){
        chatTemp = chats_dev_json;
        userTemp = userMessages;
      }else if (widget.role == "Developer"){
        chatTemp = chats_company_json;
        userTemp = comMessages;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }

  Widget getBody() {
    return ListView(
      padding: const EdgeInsets.only(top: 20),
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, top: 0, right: 8),
          child: Container(
            height: 38,
            decoration: BoxDecoration(
              color: grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(5)
            ),
            child: TextField(
              cursorColor: black.withOpacity(0.5),
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: black.withOpacity(0.5),
                ),
                hintText: "Search 0 Matches"
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),    
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: List.generate(chatTemp.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 70,
                          height: 70,
                          child: Stack(
                            children: <Widget>[
                              chatTemp[index]['story']
                                ? Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: primary,
                                      width: 3
                                    )
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Container(
                                      width: 70,
                                      height: 70,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: AssetImage(
                                            chatTemp[index]['img']
                                          ),
                                          fit: BoxFit.cover
                                        )
                                      ),
                                    ),
                                  ),
                                )
                              : Container(
                                width: 65,
                                height: 65,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(
                                      chatTemp[index]['img']
                                    ),
                                    fit: BoxFit.cover
                                  )
                                ),
                              ),
                              chatTemp[index]['online']
                                ? Positioned(
                                  top: 48,
                                  left: 52,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: green,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: white,
                                        width: 3
                                      )
                                    ),
                                  ),
                                )
                                : Container()
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 70,
                          child: Align(
                            child: Text(
                              chatTemp[index]['name'],
                              overflow: TextOverflow.ellipsis,
                            )
                          ),
                        )
                      ],
                    ),
                  );
                })),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                children: List.generate(userTemp.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 70,
                          height: 70,
                          child: Stack(
                            children: <Widget>[
                              userTemp[index]['story']
                                  ? Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: primary, width: 3)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Container(
                                          width: 70,
                                          height: 70,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      userTemp[index]
                                                          ['img']),
                                                  fit: BoxFit.cover)),
                                        ),
                                      ),
                                    )
                                  : Container(
                                      width: 65,
                                      height: 65,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  userTemp[index]['img']),
                                              fit: BoxFit.cover)),
                                    ),
                              userTemp[index]['online']
                                  ? Positioned(
                                      top: 48,
                                      left: 52,
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                            color: green,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: white, width: 3)),
                                      ),
                                    )
                                  : Container()
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Inbox()));
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                userTemp[index]['name'],
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 135,
                                child: Text(
                                  userTemp[index]['message'] +
                                      " - " +
                                      userTemp[index]['created_at'],
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: black.withOpacity(0.8)),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                        ),
                        ],
                    ),
                  );
                }),
              ),
            )
          ],
        ),
      ],
    );
  }
}

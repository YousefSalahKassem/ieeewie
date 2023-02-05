import 'package:flutter/material.dart';
import 'package:ieeewie/user_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int id = 1;
  bool showBox = false;

  List<Map> chatsList = [
    {
      "name": "yousef salah kassem",
      "image":
      "https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8&w=1000&q=80",
      "message": "hi how are you ?",
      "date": DateTime.now().weekday
    },
    {
      "name": "mohamed salah",
      "image":
      "https://letsenhance.io/static/334225cab5be263aad8e3894809594ce/75c5a/MainAfter.jpg",
      "message": "Are you here ?",
      "date": DateTime.now().weekday
    },
    {
      "name": "ahmed gamal",
      "image":
      "https://www.incimages.com/uploaded_files/image/1920x1080/getty_481292845_77896.jpg",
      "message": "hello?",
      "date": DateTime.now().weekday
    },
  ];

  String getDayName(int weekday){
    switch(weekday) {
      case 1: return "sat";
      case 2: return "sun";
      case 3: return "mon";
      case 4: return "tus";
      case 5: return "wen";
      case 6: return "thr";
      case 7: return "fri";
      default: return "";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Chats"),
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: const Icon(
          Icons.menu,
          color: Colors.blue,
        ),
        actions: [
          GestureDetector(
          onTap: (){
            showBox = !showBox;
            setState(() {

            });
          },
          child: const Icon(Icons.edit, color: Colors.blue),
        )],
      ),
      body: Column(
        children: [
          // search box
          AnimatedSize(
              duration: const Duration(milliseconds: 400),
              child: showBox ? Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(15)),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.grey
                    ),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search,color: Colors.grey,),
                  ),
                  style: const TextStyle(color: Colors.grey),
                ),
              ) : const SizedBox(),
          ),

          // list of users
          SizedBox(
            height: 100,
            child: ListView.builder(
                itemCount: usersList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final user = usersList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        // image
                        Container(
                          height: 48,
                          width: 48,
                          margin: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      user.image))),
                        ),

                         Text(
                          user.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  );
                }),
          ),

          // list of chats
          Expanded(
              child: ListView.builder(
                itemCount: chatsList.length,
                itemBuilder: (context, index) {
                  final chat = chatsList[index];
                  return Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    child: Row(
                      children: [
                        Container(
                          height: 48,
                          width: 48,
                          margin: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      chat["image"]))),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              Text(
                                chat["name"],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                    chat["message"],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  const SizedBox(width: 5,),
                                  Text(
                                    getDayName(chat["date"]),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              )),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
                    id = 1;
                    setState(() {

                    });
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.message,
                        color: id == 1 ? Colors.blue: Colors.grey,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Chats",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    id =2 ;
                    setState(() {

                    });
                  },
                  child: Column(
                    children:  [
                      Icon(
                        Icons.videocam,
                        color: id == 2 ? Colors.blue: Colors.grey,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Calls",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    id = 3;
                    setState(() {

                    });
                  },
                  child: Column(
                    children: [
                      Icon(
                          Icons.people,
                          color: id == 3 ? Colors.blue: Colors.grey
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "People",
                        style: TextStyle(color: id == 3 ? Colors.blue: Colors.grey,),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    id = 4;
                    setState(() {

                    });
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.web_stories,
                        color: id == 4 ? Colors.blue: Colors.grey,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Stories",
                        style: TextStyle(color: id ==4 ? Colors.blue: Colors.grey,),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

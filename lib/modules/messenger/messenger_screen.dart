import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  const MessengerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: const [
            CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(
                  'https://scontent.fgza2-1.fna.fbcdn.net/v/t1.6435-9/192739877_2541406519499417_534168991885857154_n.jpg?_nc_cat=103&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=6tRgXtiVTl4AX83juQO&tn=XV5S_JkgW7csGulv&_nc_ht=scontent.fgza2-1.fna&oh=00_AT89d8pWRCYOzSX-SMZPFpXSUmWHUHR8H3FuQO5paNPLqw&oe=621662EC'),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              "Chats",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              backgroundColor: Colors.grey[200],
              radius: 25,
              child: const Icon(
                Icons.camera_alt,
                color: Colors.black,
                size: 20,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              backgroundColor: Colors.grey[200],
              radius: 25,
              child: const Icon(
                Icons.edit,
                color: Colors.black,
                size: 20,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.search,
                          size: 22,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Search",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 120,
                      child: ListView.separated(
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => BuildStoryItem(),
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(width: 7)),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  SizedBox(height: 13),
                  Container(
                    child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => BuildChatItem(),
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(height: 13),
                      itemCount: 20,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  //1. build item
  Widget BuildChatItem() => Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              const CircleAvatar(
                radius: 25,
                child: Image(
                  image: AssetImage('images/user_image.png'),
                ),
              ),
              Stack(
                alignment: AlignmentDirectional.center,
                children: const [
                  CircleAvatar(
                    radius: 9,
                    backgroundColor: Colors.white,
                  ),
                  CircleAvatar(
                    radius: 6,
                    backgroundColor: Colors.green,
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Mohammed Ahmed',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  children: const [
                    Text(
                      'How Are You Doing Today?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.circle,
                      size: 6,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '02.00',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );

  Widget BuildStoryItem() {
    return Row(
      children: [
        SizedBox(
          width: 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircleAvatar(
                  radius: 30,
                  child: Image(image: AssetImage('images/user_image.png'))),
              SizedBox(height: 10),
              Text(
                'Mohamed sharekh',
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13,
                  height: 1,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Widget BuildStoryItemFirst() => SizedBox(
  //       width: 60,
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: const [
  //           CircleAvatar(
  //             radius: 30,
  //             child: Icon(
  //               Icons.video_call,
  //               size: 30,
  //             ),
  //           ),
  //           SizedBox(height: 10),
  //           Text(
  //             'Create a room',
  //             textAlign: TextAlign.center,
  //             maxLines: 2,
  //             overflow: TextOverflow.ellipsis,
  //           ),
  //         ],
  //       ),
  //     );

}

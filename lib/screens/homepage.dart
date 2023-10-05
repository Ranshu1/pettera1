import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pettera/screens/full_image_screen.dart';
import 'package:pettera/widget/CurveClipper.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final List<Map<String, String>> img = [
    {
      'imageUrl':
          "https://t4.ftcdn.net/jpg/00/97/58/97/360_F_97589769_t45CqXyzjz0KXwoBZT9PRaWGHRk5hQqQ.jpg",
      'text': "Snowy",
    },
    {
      'imageUrl':
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSp3Fh0u2T0qF_PlBhSmrw1vUNj3pzCR1my9EClwSjRew&s",
      'text': "Sandy"
    }
  ];
  final List<String> onlyimg = [
    "https://t4.ftcdn.net/jpg/00/97/58/97/360_F_97589769_t45CqXyzjz0KXwoBZT9PRaWGHRk5hQqQ.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSp3Fh0u2T0qF_PlBhSmrw1vUNj3pzCR1my9EClwSjRew&s"
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

          body: Stack(
        children: [
          Align(
            alignment: const Alignment(0, 2),
            child: DefaultTabController(
              length: 3,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.95,
                decoration: const BoxDecoration(
                  color: Color(0xff1C1B20),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.22,
                    ),
                    const Text(
                      "Shane Mathias",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Co founder",
                          style: TextStyle(fontSize: 13, color: Colors.white),
                        ),
                        Image.asset(
                          "assets/images/10.jpg",
                          width: 20,
                          height: 20,
                        )
                      ],
                    ),
                   const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.16,
                      child: ListView.builder(
                          padding: const EdgeInsets.only(left: 20),
                          scrollDirection: Axis.horizontal,
                          itemCount: img.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (){Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FullImageScreen(
                          url:
                              img[index]['imageUrl']!),
                    ));
                              },
                              child: MakeSave(img[index], context));
                          }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              "2",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04),
                            ),
                            Text(
                              "Posts",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04),
                            ),
                          ],
                        ),
                        const SizedBox(width: 30),
                        Container(
                          width: 2,
                          height: 30,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 30),
                        Column(
                          children: [
                            Text(
                              "1",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04),
                            ),
                            Text(
                              "Followers",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04),
                            ),
                          ],
                        ),
                        const SizedBox(width: 30),
                        Container(
                          width: 2,
                          height: 30,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 30),
                        Column(
                          children: [
                            Text(
                              "2",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04),
                            ),
                            Text(
                              "Following",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                   const TabBar(
                      indicatorWeight: 2,
                      indicatorSize: TabBarIndicatorSize.label,
                      tabs: [
                        Tab(
                          text: "Posts",
                        ),
                        Tab(text: "Stamp Book"),
                        Tab(text: "Community"),
                      ],
                    ),
                    Expanded(
                        child: TabBarView(
                      children: [
                        GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, crossAxisSpacing: 8),
                          itemCount: onlyimg.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (){Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FullImageScreen(
                          url:
                              onlyimg[index]),
                    ));
                              },
                              child: showimage(onlyimg[index]));
                          },
                          padding: const EdgeInsets.only(left: 10, right: 10),
                        ),

                        // Stampbook Tab View
                        const Center(
                          child: Text("Stampbook Tab Content"),
                        ),

                        // Community Tab View
                        const Center(
                          child: Text("Community Tab Content"),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            ),
          ),
          ClipPath(
            clipper: CurveClipper(),
            child: Container(
              color: const Color(0xff2196F3),
              height: MediaQuery.of(context).size.height * 0.13,
            ),
          ),
          Align(
            alignment: Alignment(0.83, -0.98),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color(0xff1C1B20),
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                    vertical: MediaQuery.of(context).size.width * 0.02),
                child: Text(
                  "Following",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.04),
                ),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0, -0.98),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FullImageScreen(
                          url:
                              "https://media.licdn.com/dms/image/D5603AQGd1-SYnti4DQ/profile-displayphoto-shrink_800_800/0/1691923380637?e=2147483647&v=beta&t=Dbz-ponAvqeIKehgIRiiIEW9lFQMmvzxrDTDJkvs4zU"),
                    ));
              },
              child: Hero(
                tag: "https://media.licdn.com/dms/image/D5603AQGd1-SYnti4DQ/profile-displayphoto-shrink_800_800/0/1691923380637?e=2147483647&v=beta&t=Dbz-ponAvqeIKehgIRiiIEW9lFQMmvzxrDTDJkvs4zU",
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height *
                      0.2, 
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.contain, 
                      image: CachedNetworkImageProvider(
                        "https://media.licdn.com/dms/image/D5603AQGd1-SYnti4DQ/profile-displayphoto-shrink_800_800/0/1691923380637?e=2147483647&v=beta&t=Dbz-ponAvqeIKehgIRiiIEW9lFQMmvzxrDTDJkvs4zU",
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }

  Widget MakeSave(Map<String, String> imageInfo, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.15,
            height: MediaQuery.of(context).size.height * 0.08,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(imageInfo['imageUrl']!),
              ),
            ),
          ),
          Text(
            imageInfo['text']!,
            style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width * 0.035),
          )
        ],
      ),
    );
  }

  Widget showimage(String url) {
    return Hero(
      tag: url,
      child: Container(
        child: CachedNetworkImage(
          imageUrl: url,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

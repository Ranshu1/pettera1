import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pettera/models/models.dart';
import 'package:pettera/screens/full_image_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pettera/services/api.dart';
import 'package:pettera/widget/CustomLoading.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);
  static String apiKey =
      "mweSiUvSIOEmCTJlRcLeUSUQfFQ7LBQd1sXjYeJVQlaigyCEGSQ0tsjf";

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  List<Photos> photos = [];
  String randomAnimal = "";
  List<String> animal_name = [
    "Lion",
    "Tiger",
    "Elephant",
    "Giraffe",
    "Zebra",
    "Kangaroo",
    "Hippopotamus",
    "Cheetah",
    "Leopard",
    "Panda",
    "Koala",
    "Gorilla",
    "Rhino",
    "Hedgehog",
    "Dolphin",
    "Octopus",
    "Koala",
    "Sloth",
    "Penguin",
    "Kangaroo",
    "Polar Bear",
    "Koala",
    "Arctic Fox",
    "Panda",
    "Koala",
    "Toucan",
    "Panda",
    "Lion",
    "Koala",
    "Hippopotamus",
    "Penguin",
    "Gorilla",
    "Koala",
    "Panda",
    "Koala",
    "Sloth",
    "Dolphin",
    "Koala",
    "Penguin",
    "Kangaroo",
    "Koala",
    "Koala",
    "Panda",
    "Zebra",
    "Gorilla",
    "Tiger",
    "Koala",
    "Lion",
    "Kangaroo",
    "Hippopotamus"
  ];
  String getRandomAnimal() {
    int randomIndex = Random().nextInt(animal_name.length);
    return animal_name[randomIndex];
  }

  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    randomAnimal = getRandomAnimal();
    getimage(randomAnimal);
  }

  getimage(String query) async {
    photos = await FetchApi().getPhotos(query);
    print(photos);
    setState(() {
      isLoading = false;
    });
    setState(() {
      
    });
  }


  @override
  Widget build(BuildContext context) {
    var wid = MediaQuery.of(context).size.width;
    var hei = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor:
            Colors.blueGrey[900],
        title: Text(
          'Pettera',
          style: GoogleFonts.pacifico(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 28,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      getimage(_searchController.text);
                    },
                  ),
                  Expanded(
                    child: TextField(
                      textInputAction: TextInputAction.search,
                      controller: _searchController,
                      onSubmitted: (value) {
                        if (value.trim().isEmpty) {
                          // getPhotos("peacock");
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.blue,
                              content: Text('Blank Search'),
                              duration: Duration(
                                  seconds:
                                      2), 
                            ),
                          );
                        } else {
                          getimage(value.trim());
                        }
                      },
                      decoration: const InputDecoration(
                        hintText: "Search animal name",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: isLoading
                ? CustomLoadingIndicator()
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: wid * 0.7 / (hei * 0.33),
                    ),
                    itemCount: photos.length,
                    itemBuilder: (context, index) {
                      return GridTile(
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                15), // Rounded corners for cards
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FullImageScreen(
                                    url: photos[index].src!.portrait as String,
                                  ),
                                ),
                              );
                            },
                            child: Hero(
                              tag: photos[index].src!.portrait as String,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Expanded(
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          photos[index].src!.portrait as String,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

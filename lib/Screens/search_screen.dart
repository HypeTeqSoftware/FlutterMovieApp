import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchItem = '';

  List<String> listOfTvShows=[
    "assets/searchImages/boboiboy galexy.jpg",
    "assets/searchImages/devilman.jpg",
    "assets/searchImages/what if.jpg"
  ];
  List<String> listOfMovie=[
    "assets/searchImages/street fighter.jpg",
    "assets/searchImages/Street kings.jpg",
    "assets/searchImages/paterpan and wendy.jpg"

  ];
  List<String> listOfSeries=[
    "assets/searchImages/sherlock.jpg",
    "assets/searchImages/stranger things.jfif",
    "assets/searchImages/money heist.jpg"
  ];

  List<String> filteredListTvShows = [];
  List<String> filteredListMovie = [];
  List<String> filteredListSeries = [];

  @override
  void initState() {
    super.initState();
    filteredListTvShows = listOfTvShows;
    filteredListMovie = listOfMovie;
    filteredListSeries = listOfSeries;
  }

  void updateFilteredLists(String query) {
    setState(() {
      filteredListTvShows = _filterItems(listOfTvShows, query);
      filteredListMovie = _filterItems(listOfMovie, query);
      filteredListSeries = _filterItems(listOfSeries, query);
    });
  }

  List<String> _filterItems(List<String> list, String query) {
    return list
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light ?Colors.grey.shade100 :Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 55),
              child: Container(
                height: 40,
                child: TextFormField(
                  cursorColor:  Theme.of(context).brightness == Brightness.light ? Colors.black:Colors.white,
                  textInputAction: TextInputAction.search,
                  onChanged: (value){
                    searchItem = value;
                    updateFilteredLists(value);
                  },
                  decoration: InputDecoration(
                    hintText: "Search here",
                    hintStyle: TextStyle(
                        color: Theme.of(context).brightness == Brightness.light ? Colors.black38:Colors.white60
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 20.0),
                    filled: true,
                    fillColor: Theme.of(context).brightness == Brightness.light ? Colors.white:Colors.grey.shade900,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.black38
                          : Colors.white60,
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: filteredListTvShows.isNotEmpty,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Text("TV SHOWS",
                      style: TextStyle(
                          fontFamily: 'Gotham',
                          color:Theme.of(context).brightness == Brightness.light ?Colors.black54 :Colors.white70,
                          fontWeight: FontWeight.w600,
                          fontSize: 12),
                    ),
                  ),
                  Container(
                      height: 1,
                      width: 240,
                      color: Theme.of(context).brightness == Brightness.light ?  Colors.black:Colors.white24
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8,),
            Visibility(
              visible: filteredListTvShows.isNotEmpty,
                child: searchListWidget(filteredListTvShows,["Boboiboy Galexy", "Devilman", "What If..."])),
            Visibility(
              visible: filteredListMovie.isNotEmpty,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Text("MOVIES",
                      style: TextStyle(
                          fontFamily: 'Gotham',
                          color:Theme.of(context).brightness == Brightness.light ?Colors.black54 :Colors.white70,
                          fontWeight: FontWeight.w600,
                          fontSize: 12),
                    ),
                  ),
                  Container(
                      height: 1,
                      width: 260,
                      color: Theme.of(context).brightness == Brightness.light ?  Colors.black:Colors.white24
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8,),
            Visibility(
                visible: filteredListMovie.isNotEmpty,
                child: searchListWidget(filteredListMovie,["Street Fighter", "Street Kings", "Peter Pan and Wendy"])),
            Visibility(
              visible: filteredListSeries.isNotEmpty,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Text("SERIES",
                      style: TextStyle(
                          fontFamily: 'Gotham',
                          color:Theme.of(context).brightness == Brightness.light ?Colors.black54 :Colors.white70,
                          fontWeight: FontWeight.w600,
                          fontSize: 12),
                    ),
                  ),
                  Container(
                      height: 1,
                      width: 260,
                      color: Theme.of(context).brightness == Brightness.light ?  Colors.black:Colors.white24
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8,),
            Visibility(
                visible: filteredListSeries.isNotEmpty,
                child: searchListWidget(filteredListSeries,["Sherlock", "Stranger Things", "Money Heist"])),
          ],
        ),
      ),
    );
  }
  Widget searchListWidget(List<String> listOfImages,List<String> listOfNames){
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: listOfImages.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: 140,
                    height: 180,
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(listOfImages[index],fit: BoxFit.cover,)),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      color: Theme.of(context).brightness == Brightness.light ?Colors.white24:Colors.black54,
                      child: Center(
                        child: Text(textAlign: TextAlign.center,
                          listOfNames[index],
                          style:  TextStyle(
                            color: Theme.of(context).brightness == Brightness.light ?Colors.white:Colors.amber,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

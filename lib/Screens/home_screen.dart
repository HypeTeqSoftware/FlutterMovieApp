import 'package:flutter/material.dart';
import 'package:photoplay_app/Models/watching_detail_model.dart';
import 'package:photoplay_app/Screens/cast_detail_screen.dart';
import 'package:photoplay_app/Screens/new_upcoming_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light ?Colors.grey.shade100 :Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Theme.of(context).brightness == Brightness.light? MediaQuery.of(context).size.height/1.8: MediaQuery.of(context).size.height/1.6,
              width: MediaQuery.of(context).size.width,
              child: Theme.of(context).brightness == Brightness.light
                  ? Image.asset("assets/home_image_light.png",fit: BoxFit.cover)
                  : Image.asset("assets/home_image_dark.png",fit: BoxFit.cover)),
            Center(
              child: Theme.of(context).brightness == Brightness.light? Text("4.0",style: TextStyle(
                  fontFamily: 'Gotham',
                  color:Theme.of(context).brightness == Brightness.light ?Colors.black :Colors.white,
                  fontSize: MediaQuery.of(context).size.width/9),)
                  :Text("4.0",style: TextStyle(
                  fontFamily: 'Gotham',
                  color:Theme.of(context).brightness == Brightness.light ?Colors.black :Colors.white,
                  fontSize: MediaQuery.of(context).size.width/9.8),)
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/star_fill.png",height: 13,),
                const SizedBox(width: 5,),
                Image.asset("assets/star_fill.png",height: 13,),
                const SizedBox(width: 5,),
                Image.asset("assets/star.png",height: 13,),
                const SizedBox(width: 5,),
                Image.asset("assets/star.png",height: 13,),
                const SizedBox(width: 5,),
                Image.asset("assets/star.png",height: 13,),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Movie",style: TextStyle(
                    fontFamily: 'Gotham',
                    fontSize: 12,
                    color:Theme.of(context).brightness == Brightness.light ? Colors.black:Colors.white70
                ),),
                Container(
                    height: 15,
                    width: 1,
                    color: Theme.of(context).brightness == Brightness.light ? Colors.black:Colors.white60
                ),
                Text("Adventure",style: TextStyle(
                    fontFamily: 'Gotham',
                    fontSize: 12,
                    color: Theme.of(context).brightness == Brightness.light ? Colors.black:Colors.white70
                )),
                Container(
                    height: 15,
                    width: 1,
                    color: Theme.of(context).brightness == Brightness.light ?  Colors.black:Colors.white60
                ),
                Text("Comady",style: TextStyle(
                    fontFamily: 'Gotham',
                    fontSize: 12,
                    color: Theme.of(context).brightness == Brightness.light ? Colors.black:Colors.white70
                )),
                Container(
                    height: 15,
                    width: 1,
                    color: Theme.of(context).brightness == Brightness.light ?  Colors.black:Colors.white60
                ),
                Text("Family",style: TextStyle(
                    fontFamily: 'Gotham',
                    fontSize: 12,
                    color:Theme.of(context).brightness == Brightness.light ? Colors.black:Colors.white70
                )),
              ],
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text("Watching",style: TextStyle(
                  fontFamily: 'Gotham',
                  fontSize: 16,
                  color:Theme.of(context).brightness == Brightness.light ? Colors.black:Colors.white,
                  fontWeight: FontWeight.bold
              )),
            ),
            const SizedBox(height: 5),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: watchingimages.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CastDetailScreen(image: watchingimages[index]),));
                        },
                        child: Container(
                          width: 140,
                          height: 180,
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(watchingimages[index].images,fit: BoxFit.cover,)),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text("New & Upcoming",style: TextStyle(
                  fontFamily: 'Gotham',
                  fontSize: 16,
                  color:Theme.of(context).brightness == Brightness.light ? Colors.black:Colors.white,
                  fontWeight: FontWeight.bold
              )),
            ),
            const SizedBox(height: 5),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: watchingimages.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const NewAndUpcomingScreen(),));
                        },
                        child: Container(
                          width: 140,
                          height: 180,
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(watchingimages[index].images,fit: BoxFit.cover,)),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:photoplay_app/Models/new_upcoming_model.dart';

class NewAndUpcomingScreen extends StatefulWidget {
  const NewAndUpcomingScreen({Key? key}) : super(key: key);

  @override
  State<NewAndUpcomingScreen> createState() => _NewAndUpcomingScreenState();
}

class _NewAndUpcomingScreenState extends State<NewAndUpcomingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light ?Colors.grey.shade100 :Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height/2.8,
                  width: MediaQuery.of(context).size.width,
                  child:
                  Theme.of(context).brightness == Brightness.light
                      ? Image.asset("assets/tv_show.png",fit: BoxFit.cover)
                      : Image.asset("assets/tv_show.png",fit: BoxFit.cover),
                ),
                Theme.of(context).brightness == Brightness.light ? Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.grey.shade100,
                        ],
                      ),
                    ),
                  ),
                )
                    :Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(1),
                          Colors.transparent,
                          Colors.black.withOpacity(1),
                        ],
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 35),
                      child: Row(
                        children: [
                          InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Image.asset("assets/back_btn.png",height: 15,color: Colors.white,)),
                          const SizedBox(width: 8),
                          InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: const Text("Back",style: TextStyle(fontFamily: 'Gotham',color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Center(child: Image.asset("assets/play-button.png",height: 50,)),
                    ),
                    const SizedBox(height: 40,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text("Narcos",style: TextStyle(fontFamily: 'Gotham',color:Theme.of(context).brightness == Brightness.light? Colors.black:Colors.white,fontSize: 18,fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Drama",style: TextStyle(
                            fontFamily: 'Gotham',
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color:Theme.of(context).brightness == Brightness.light ? Colors.black:Colors.white70
                        ),),
                        Container(
                            height: 15,
                            width: 1,
                            color: Theme.of(context).brightness == Brightness.light ? Colors.black:Colors.white60
                        ),
                        Text("Biographical",style: TextStyle(
                            fontFamily: 'Gotham',
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).brightness == Brightness.light ? Colors.black:Colors.white70
                        )),
                        Container(
                            height: 15,
                            width: 1,
                            color: Theme.of(context).brightness == Brightness.light ?  Colors.black:Colors.white60
                        ),
                        Text("Crime Film",style: TextStyle(
                            fontFamily: 'Gotham',
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).brightness == Brightness.light ? Colors.black:Colors.white70
                        )),
                        Container(
                            height: 15,
                            width: 1,
                            color: Theme.of(context).brightness == Brightness.light ?  Colors.black:Colors.white60
                        ),
                        Text("Crime Fiction",style: TextStyle(
                            fontFamily: 'Gotham',
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color:Theme.of(context).brightness == Brightness.light ? Colors.black:Colors.white70
                        )),
                      ],
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Theme.of(context).brightness == Brightness.light? Text("9.0",style: TextStyle(
                        fontFamily: 'Gotham',
                        color:Theme.of(context).brightness == Brightness.light ?Colors.black :Colors.white,
                        fontSize: MediaQuery.of(context).size.width/9),)
                        :Text("9.0",style: TextStyle(
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
                    Image.asset("assets/star_fill.png",height: 13,),
                    const SizedBox(width: 5,),
                    Image.asset("assets/star_fill.png",height: 13,),
                    const SizedBox(width: 5,),
                    Image.asset("assets/star.png",height: 13,),
                  ],
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                  child: Text(
                      textAlign: TextAlign.center,
                      "Netflix chronicles the rise of the cocaine trade in Colombia and the gripping real-life stories of brug kingpins of the late 80's in this raw.gritty original series.",
                      style: TextStyle(fontFamily: 'Gotham',color: Theme.of(context).brightness == Brightness.light ?Colors.black54 :Colors.white60,fontSize: 15,)
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 4,
                      primary: Colors.amber.shade600,
                      minimumSize: const Size(200, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'WATCH NOW',
                      style: TextStyle(
                          fontFamily: 'Gotham',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Theme.of(context).brightness == Brightness.light ? Colors.white:Colors.black
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Episodes",style: TextStyle(
                      fontFamily: 'Gotham',
                      fontSize: 16,
                      color:Theme.of(context).brightness == Brightness.light ? Colors.black:Colors.white,
                      fontWeight: FontWeight.bold
                  )),
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: newandupcoming.length,
                      itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(newandupcoming[index].image,height: 100,)),
                            const SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(newandupcoming[index].title,
                                    style: TextStyle(fontFamily: 'Gotham',color: Theme.of(context).brightness == Brightness.light ?Colors.black :Colors.white,fontSize: 13,fontWeight: FontWeight.bold)),
                                const SizedBox(height: 5,),
                                Text(newandupcoming[index].min,
                                    style: TextStyle(fontFamily: 'Gotham',color: Theme.of(context).brightness == Brightness.light ?Colors.black54 :Colors.white60,fontSize: 10,fontWeight: FontWeight.bold)),
                                const SizedBox(height: 30,),
                                Row(
                                  children: [
                                    Image.asset(newandupcoming[index].icon,height: 18,color: Colors.amber,),
                                    const SizedBox(width: 5,),
                                    Text(newandupcoming[index].download,
                                        style: TextStyle(fontFamily: 'Gotham',color: Theme.of(context).brightness == Brightness.light ?Colors.amber :Colors.amber,fontSize: 12,fontWeight: FontWeight.bold)),
                                  ],
                                )

                              ],
                            )
                          ],
                        ),
                      );
                  }),
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}

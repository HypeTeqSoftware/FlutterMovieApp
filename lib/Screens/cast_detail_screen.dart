import 'package:flutter/material.dart';
import 'package:photoplay_app/Models/cast_detail_model.dart';
import 'package:photoplay_app/Models/watching_detail_model.dart';
import 'package:photoplay_app/Screens/knowfor_screen.dart';

class CastDetailScreen extends StatefulWidget {
  final WatchingImageModel image;

  const CastDetailScreen({Key? key,required this.image}) : super(key: key);

  @override
  State<CastDetailScreen> createState() => _CastDetailScreenState();
}

class _CastDetailScreenState extends State<CastDetailScreen> {

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
                      height: MediaQuery.of(context).size.height/2,
                      width: MediaQuery.of(context).size.width,
                      child:
                      Theme.of(context).brightness == Brightness.light
                          ? Image.asset(widget.image.images,fit: BoxFit.cover)
                          : Image.asset(widget.image.images,fit: BoxFit.cover),
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
                        const SizedBox(height: 100,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(widget.image.title,style: TextStyle(fontFamily: 'Gotham',color:Theme.of(context).brightness == Brightness.light? Colors.black:Colors.white,fontSize: 18,fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Movie",style: TextStyle(
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
                            Text("Adventure",style: TextStyle(
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
                            Text("Comady",style: TextStyle(
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
                            Text("Family",style: TextStyle(
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                      child: Text(
                          textAlign: TextAlign.center,
                          "Having spent most of her life exploring the jungle,nothing could prepare Dora for her most dangerous adventure yet-high school.",
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
                      child: Text("Cast",style: TextStyle(
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
                          itemCount: listOfCast.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => KnowmoreScreen(castdetail: listOfCast[index]),));
                                  },
                                  child: Container(
                                    width: 140,
                                    height: 180,
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(listOfCast[index].img,fit: BoxFit.cover,)),
                                  ),
                                ),
                                Text(listOfCast[index].name,style: TextStyle(
                                    fontFamily: 'Gotham',
                                    fontSize: 12,
                                    color:Theme.of(context).brightness == Brightness.light ? Colors.black:Colors.white70,

                                ))
                              ],
                            );
                          },
                        ),
                      ),


                  ],
                )

              ],
        ),
      ),
    );
  }
}

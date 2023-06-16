import 'package:flutter/material.dart';
import 'package:photoplay_app/Models/cast_detail_model.dart';
import '../Models/knowfor_model.dart';

class KnowmoreScreen extends StatefulWidget {
  final CastDetailList castdetail;
  const KnowmoreScreen({Key? key,required this.castdetail}) : super(key: key);

  @override
  State<KnowmoreScreen> createState() => _KnowmoreScreenState();
}

class _KnowmoreScreenState extends State<KnowmoreScreen> {

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
                      height: MediaQuery.of(context).size.height/1.5,
                      width: MediaQuery.of(context).size.width,
                      child:
                      Theme.of(context).brightness == Brightness.light
                          ? Image.asset(widget.castdetail.img,fit: BoxFit.cover)
                          : Image.asset(widget.castdetail.img,fit: BoxFit.cover),
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
                        const SizedBox(height: 380,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Center(child: Text(widget.castdetail.name,style: TextStyle(fontFamily: 'Gotham',color:Theme.of(context).brightness == Brightness.light? Colors.black:Colors.white,fontSize: 22,fontWeight: FontWeight.bold))),
                        ),
                      ],
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                      child: Text(
                          textAlign: TextAlign.center,
                          widget.castdetail.text,
                          style: TextStyle(fontFamily: 'Gotham',color: Theme.of(context).brightness == Brightness.light ?Colors.black54 :Colors.white60,fontSize: 15,)
                      ),
                    ),
                    const SizedBox(height: 12,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Known for",style: TextStyle(
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
                        itemCount: knownforimages.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                  width: 140,
                                  height: 180,
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(knownforimages[index].images,fit: BoxFit.cover,)),
                                ),
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

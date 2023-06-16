import 'package:flutter/material.dart';
import '../Models/download_detail_model.dart';

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({Key? key}) : super(key: key);

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light ?Colors.grey.shade100 :Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: downloaddetail.length,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: 180,
                            height: 110,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                                child: Image.asset(downloaddetail[index].image,height: 100,fit: BoxFit.cover,))),
                        const SizedBox(width: 10,),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(downloaddetail[index].title,
                                  style: TextStyle(fontFamily: 'Gotham',color: Theme.of(context).brightness == Brightness.light ?Colors.black :Colors.white,fontSize: 13,fontWeight: FontWeight.bold)),
                              const SizedBox(height: 5,),
                              Row(
                                children: [
                                  Text(downloaddetail[index].episode,
                                      style: TextStyle(fontFamily: 'Gotham',color: Theme.of(context).brightness == Brightness.light ?Colors.black54 :Colors.white60,fontSize: 10,fontWeight: FontWeight.bold)),
                                  const SizedBox(width: 5,),
                                  Container(
                                      height: 15,
                                      width: 1,
                                      color: Theme.of(context).brightness == Brightness.light ?  Colors.black:Colors.white60
                                  ),
                                  const SizedBox(width: 5,),
                                  Text(downloaddetail[index].gb,
                                      style: TextStyle(fontFamily: 'Gotham',color: Theme.of(context).brightness == Brightness.light ?Colors.black54 :Colors.white60,fontSize: 10,fontWeight: FontWeight.bold)),
                                ],
                              )

                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

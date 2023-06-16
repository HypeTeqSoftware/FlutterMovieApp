class NewAndUpcomingModel {
  final String title;
  final String min;
  final String icon;
  final String download;
  final String image;


  NewAndUpcomingModel({required this.title,required this.min,required this.icon,required this.download,required this.image});
}

List<NewAndUpcomingModel> newandupcoming = [
  NewAndUpcomingModel(
    title: "1. The Kingpin Strategy",
    min: "54 min",
    icon: "assets/download.png",
    download: "Download",
    image: "assets/ep_thum_1.png",

  ),
  NewAndUpcomingModel(
    title: "2. The Cali KBG",
    min: "54 min",
    icon: "assets/download.png",
    download: "Download",
    image: "assets/ep_thum_2.png",

  ),

];
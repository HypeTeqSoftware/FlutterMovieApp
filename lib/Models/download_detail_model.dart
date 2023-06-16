class DownloadDetailModel {
  final String title;
  final String episode;
  final String gb;
  final String image;


  DownloadDetailModel({required this.title,required this.episode,required this.gb,required this.image});
}

List<DownloadDetailModel> downloaddetail = [
  DownloadDetailModel(
    image: "assets/narcos.jpg",
    title: "Narcos",
    episode: "4 Episodes",
    gb: "5.02GB",
  ),
  DownloadDetailModel(
    image: "assets/alita-battle-angel.jpg",
    title: "Alita Battle Angel",
    episode: "2 Episodes",
    gb: "1.45GB",
  ),
  DownloadDetailModel(
    image: "assets/Gotham.jpg",
    title: "Gotham",
    episode: "8 Episodes",
    gb: "10.04GB",
  ),
  DownloadDetailModel(
    image: "assets/Sacred-Games.jpg",
    title: "Sacred Games",
    episode: "3 Episodes",
    gb: "2.02GB",
  ),
  DownloadDetailModel(
    image: "assets/Shazam.png",
    title: "Shazam",
    episode: "4 Episodes",
    gb: "2.32GB",
  ),
  DownloadDetailModel(
    image: "assets/Toy story 4.jpg",
    title: "Toy Story 4",
    episode: "3 Episodes",
    gb: "3.45GB",
  ),



];
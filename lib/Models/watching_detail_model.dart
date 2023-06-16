class WatchingImageModel {
  final String images;
  final String title;

  WatchingImageModel({required this.images, required this.title});
}

List<WatchingImageModel> watchingimages = [

  WatchingImageModel(
    images: 'assets/mov_1.png',
    title: 'NARCOS',
  ),
  WatchingImageModel(
    images: 'assets/mov_2.png',
    title: 'DEADPOOL 2',
  ),
  WatchingImageModel(
    images: 'assets/mov_3.png',
    title: 'ANNABELLE COMES HOME',
  ),
  WatchingImageModel(
    images: 'assets/mov_4.png',
    title: 'TOY STORY 4',
  ),
  WatchingImageModel(
    images:'assets/home_image_dark.png',
    title: 'Dora and the Lost city of Gold',

  ),
];
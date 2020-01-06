import 'package:flutter/material.dart';
import 'package:flutter_maps/utils/utils.dart';

class Fruit {
  int id;
  String name,
      desc =
          'Tjong A Fie, a mansion-shaped building (large house) was founded by a prominent Hakka ethnic Chinese merchant named Tjong A Fie since 1895, Turning into a museum, Medan cultural attractions are much admired by Asian-themed art',
      price,
      imageBack;
  Color color;
  double rating;

  Fruit(this.id, this.name, this.price, this.imageBack, this.color,
      this.rating);
}

final List<Fruit> fruits = [
  Fruit(
      1,
      '5.5 KM - Jl. Jendral Ahmad Yani No.105, Kesawan, Medan Baru, Kota Medan',
      'Tjong A Fie',
      ImageBackground.tjongBack,
      Colors.brown,
      4.5),
  Fruit(
      2,
      '4.5 KM - Jl. Sultan Maemon Al Rasyid N0.66, Kec Medan Maimun, Kota Medan',
      'Istana Maimun',
      ImageBackground.maimunBack,
      Colors.orange,
      4.9),
  Fruit(
      3,
      '4.2 KM - Jl. Teuku Cik Ditiro No.8-6, Madras Hulu, Kec. Medan Polonia, Kota Medan',
      'Kampung Madras, Little India',
      ImageBackground.madrasBack,
      Colors.blue,
      5.0),
  Fruit(
    4,
    '4.3 KM - Jl. S. Parman No.309, Petisah Hulu, Kec. Medan Baru, Kota Medan',
    'Rahmat International Wildlife Museum',
    ImageBackground.rahmatBack,
    Colors.grey,
    4.4),
  Fruit(
      5,
      '7.1 KM - Jl. Sakura III No. 7-10, Tj. Selamat, Kec. Medan Tuntungan, Kota Medan',
      'Graha Maria Annai Velangkanni',
      ImageBackground.velangkanniBack,
      Colors.red,
      5.0),
];

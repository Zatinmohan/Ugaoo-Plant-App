import 'package:ugaoo/misc/imagesEg.dart';

class Dummy {
  final String id;
  final String name;
  final String family;
  final int price;
  final int qty;
  final image;
  final double temp;
  final String light;
  final String water;

  Dummy(this.id, this.name, this.family, this.price, this.qty, this.image,
      this.temp, this.light, this.water);
}

List<Dummy> dummyList = [
  Dummy("Plant_001", "Plant Green", "Green Family", 250, 1, seed_images[0],
      28.5, "Medium", "1/Week"),
  Dummy("Plant_002", "Plant Tall", "Blue Family", 130, 1, seed_images[1], 28,
      "Indoor Medium", "1/Month"),
  Dummy("Plant_003", "Plant Short", "Yellow Family", 1500, 1, seed_images[2],
      32.5, "Heavy", "3/Week"),
  Dummy("Plant_004", "Plant Beautiful", "White Family", 180, 1, seed_images[3],
      25, "Low", "1/Week"),
  Dummy("Plant_005", "Plant Brown", "Targarian Family", 450, 1, seed_images[4],
      30, "Low", "2/Week"),
  Dummy("Plant_006", "Plant Lilly", "Rachel Family", 600, 1, seed_images[5], 20,
      "Indoor", "2/Month"),
  Dummy("Plant_007", "Plant Animal", "Ross Family", 500, 1, seed_images[6], 32,
      "Low", "1/Week"),
  Dummy("Plant_008", "Plant Dangerous", "Barney Family", 700, 1, seed_images[7],
      28.5, "Medium", "4/Week"),
  Dummy("Plant_009", "Plant White", "Weeknd Family", 850, 1, seed_images[8], 32,
      "Heavy", "2/Week"),
];

List<Dummy> cartList = [];

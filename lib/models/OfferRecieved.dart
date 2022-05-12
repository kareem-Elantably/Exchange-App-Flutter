class Offers {
  final String name;
  final String image;
  final String Status;
  final String Tradedwith;
  final String imageT;

  Offers(this.name, this.Tradedwith, this.Status, this.image, this.imageT);
}

List<Offers> allOffers = [
  Offers("Car", "Car", "Pending", "car.jpg", "car.jpg"),
  Offers("Toy", "Toy", "accepted", "toy.jpg", "toy.jpg"),
  //Offers("Shoes", "Shoes", "rejected", "shoes.png", "shoes.png"),
  //Offers("Guitar", "Mobile", "Pending", "guitar.png", "mob.png"),
  Offers("Fan", "TV", "accepted", "fan.jpg", "tv.jpg"),
];

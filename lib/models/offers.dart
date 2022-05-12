class Offers {
  final String name;
  final String image;
  final String Status;
  final String Tradedwith;
  final String imageT;

  Offers(this.name, this.Tradedwith, this.Status, this.image, this.imageT);
}

List<Offers> allOffers = [
  Offers("Mobile", "Car", "Pending", "mob.png", "laptop.jpg"),
  Offers("Addidas shoes", "Toy", "accepted", "shoes.png", "toy.jpg"),
  Offers("Guitar", "Mobile", "Pending", "guitar.png", "mob.png"),
   Offers("Mobile", "Shoes", "rejected", "mob.png", "shoes.png"),
  Offers("Guitar", "Mobile", "Pending", "guitar.png", "mob.png"),
  Offers("Nike shoes", "Toy", "accepted", "shoes.png", "toy.jpg"),
    Offers("shoes", "Toy", "accepted", "shoes.png", "toy.jpg"),


];

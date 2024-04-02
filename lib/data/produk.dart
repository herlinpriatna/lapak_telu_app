class Produk {
  final String name;
  final String image;
  final String price;
  final String description;

  Produk(
      {required this.name,
      required this.image,
      required this.price,
      required this.description});
}

// List produk
List<Produk> produks = [
  Produk(
    name: 'Kaos Polos',
    image: 'assets/images/kaos_polos.jpeg',
    price: '100.000',
    description: 'Kaos polos berbahan katun.',
  ),
  Produk(
    name: 'Smartphone',
    image: 'assets/images/smartphone.jpeg',
    price: '25.000.000',
    description: 'Smartphone terbaru dengan kamera canggih.',
  ),
  Produk(
    name: 'Laptop',
    image: 'assets/images/laptop.jpeg',
    price: '8.000.000',
    description: 'Laptop dengan performa tinggi.',
  ),
  // Tambahkan produk lainnya sesuai kebutuhan Anda
];
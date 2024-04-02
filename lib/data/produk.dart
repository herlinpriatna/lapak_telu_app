class Produk {
  final String name;
  final String image;
  final String price;
  final String category;
  final String condition;
  final String stock;
  final String description;

  Produk(
      {required this.name,
      required this.image,
      required this.price,
      required this.category,
      required this.condition,
      required this.stock,
      required this.description});
}

// List produk
List<Produk> produks = [
  Produk(
    name: 'Kaos Polos',
    image: 'assets/images/kaos_polos.jpeg',
    price: '100.000',
    category: 'Pakaian',
    condition: 'Mulus seperti baru',
    stock: '4',
    description: 'Kaos polos berbahan katun.',
  ),
  Produk(
    name: 'iPhone 13 Pro Max',
    image: 'assets/images/smartphone.jpeg',
    price: '25.000.000',
    category: 'Smartphone',
    condition: 'Cacat sedikit',
    stock: '2',
    description: 'Smartphone terbaru dengan kamera canggih.',
  ),
  Produk(
    name: 'Laptop',
    image: 'assets/images/laptop.jpeg',
    price: '8.000.000',
    category: 'Elektronik',
    condition: 'Cacat sedikit',
    stock: '1',
    description: 'Laptop dengan performa tinggi.',
  ),
  // Tambahkan produk lainnya sesuai kebutuhan Anda
];
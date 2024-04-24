import 'package:flutter/material.dart';
import 'package:lapak_telu_app/data/produk.dart';
import 'package:lapak_telu_app/screen/detail_produk_page.dart';

class EksplorasiPage extends StatefulWidget {
  const EksplorasiPage({Key? key}) : super(key: key);

  @override
  _EksplorasiPageState createState() => _EksplorasiPageState();
}

class _EksplorasiPageState extends State<EksplorasiPage> {
  List<Produk> displayedProducts = [];

  @override
  void initState() {
    super.initState();
    loadMoreProducts();
  }

  void loadMoreProducts() {
    setState(() {
      int currentIndex = displayedProducts.length;
      int endIndex =
          currentIndex + 4 < produks.length ? currentIndex + 4 : produks.length;
      displayedProducts.addAll(produks.sublist(currentIndex, endIndex));
    });
  }

  int selectedCategoryIndex = -1;
  Color iconColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Eksplorasi",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: Column(
          children: [
            // Search
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 40.0,
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.black, // Outline color
                              width: 0.5, // Outline width
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  IconButton(
                    icon: Icon(Icons.filter_list),
                    color: Colors.blue,
                    onPressed: () => {},
                  ),
                ],
              ),
            ),
            // Kategori
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
              child: SizedBox(
                height: 40.0,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    final kategori = [
                      'Produk Baru',
                      'Produk Populer',
                      'Pakaian',
                      'Elektronik',
                      'Smartphone'
                    ][index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategoryIndex = index;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Colors.blue,
                            width: 1.0,
                          ),
                          color: selectedCategoryIndex == index
                              ? Colors.blue
                              : Colors.white,
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: Center(
                          child: Text(
                            kategori,
                            style: TextStyle(
                              fontSize: 14.0,
                              color: selectedCategoryIndex == index
                                  ? Colors.white
                                  : Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 8.0);
                  },
                ),
              ),
            ),

            // Daftar Produk dalam GridView
            Expanded(
              child: GridView.count(
                crossAxisCount: 2, // Dua kolom
                childAspectRatio:
                    0.7, // Rasio lebar-ke-tinggi untuk setiap item
                padding: EdgeInsets.all(12.0),
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                children: displayedProducts.map((produk) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailProdukPage(
                            product: produk,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Image.asset(
                              produk.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  produk.name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text(
                                  "\Rp ${produk.price}",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            // Load More Button
            if (displayedProducts.length < produks.length)
              ElevatedButton(
                onPressed: loadMoreProducts,
                child: Text(
                  "Lebih banyak",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

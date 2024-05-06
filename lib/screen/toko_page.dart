import 'package:flutter/material.dart';
import 'package:lapak_telu_app/data/produk.dart';
import 'package:lapak_telu_app/screen/detail_produk_page.dart';

class TokoPage extends StatefulWidget {
  const TokoPage({Key? key}) : super(key: key);

  @override
  _TokoPageState createState() => _TokoPageState();
}

class _TokoPageState extends State<TokoPage> {
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
              child: Text("Toko Anda",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold))),
          backgroundColor: Colors.blue,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: Column(
          children: [
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
                                    fontSize: 16,
                                  ),
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

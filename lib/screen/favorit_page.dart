import 'package:flutter/material.dart';
import 'package:lapak_telu_app/data/produk.dart';
import 'package:lapak_telu_app/screen/detail_produk_page.dart';

class FavoritPage extends StatefulWidget {
  const FavoritPage({super.key});

  @override
  _FavoritPageState createState() => _FavoritPageState();
}

class _FavoritPageState extends State<FavoritPage> {
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
          currentIndex + 6 < produks.length ? currentIndex + 6 : produks.length;
      displayedProducts.addAll(produks.sublist(currentIndex, endIndex));
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Favorit",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: displayedProducts.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: ListTile(
                      leading: Image.asset(
                        displayedProducts[index].image,
                        width: 50,
                        height: 50,
                      ),
                      title: Text(displayedProducts[index].name),
                      subtitle: Text("\Rp ${displayedProducts[index].price}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Chat',
                                style: TextStyle(color: Colors.blue)),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailProdukPage(
                              product: displayedProducts[index],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            if (displayedProducts.length < produks.length)
              ElevatedButton(
                onPressed: loadMoreProducts,
                child: const Text("Load More",
                    style: TextStyle(color: Colors.blue)),
              ),
          ],
        ),
      ),
    );
  }
}

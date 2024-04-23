import 'package:flutter/material.dart';
import 'package:lapak_telu_app/data/produk.dart';
import 'package:lapak_telu_app/screen/home_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:clipboard/clipboard.dart';

class DetailProdukPage extends StatelessWidget {
  final Produk product;

  const DetailProdukPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Detail Produk',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.all(24),
                  child: Image.asset(product.image),
                ),
              ),
              Container(
                margin: EdgeInsets.all(18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: TextStyle(
                            fontSize: 20,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        Text(
                          'Rp${product.price}',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ],
                    ),
                    Row(children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.all(8),
                        child: IconButton(
                          icon: Icon(Icons.share_outlined),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Bagikan Produk"),
                                  content: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          final url =
                                              'https://lapak-telu.com/produk/${product.name}';
                                          FlutterClipboard.copy(url).then(
                                              (value) =>
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                        content: Text(
                                                            'Link berhasil disalin')),
                                                  ));
                                        },
                                        child: Image.asset(
                                          'assets/images/icon-link.png',
                                          width: 40,
                                          height: 40,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          final url = 'https://wa.me/';
                                          launch(url);
                                        },
                                        child: Image.asset(
                                          'assets/images/icon-whatsapp.png',
                                          width: 40,
                                          height: 40,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          final url = 'https://instagram/';
                                          launch(url);
                                        },
                                        child: Image.asset(
                                          'assets/images/icon-instagram.png',
                                          width: 40,
                                          height: 40,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          final url = 'https://facebook/';
                                          launch(url);
                                        },
                                        child: Image.asset(
                                          'assets/images/icon-facebook.png',
                                          width: 40,
                                          height: 40,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.all(8),
                          child: Icon(Icons.favorite_border),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12),
                            borderRadius: BorderRadius.circular(8),
                          )),
                    ])
                  ],
                ),
              ),
              Divider(
                thickness: 2,
                color: Colors.grey,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Detail',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          'Stok',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(width: 102),
                        Text(
                          '${product.stock}',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Divider(),
                    Row(
                      children: [
                        Text(
                          'Kondisi',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(width: 81),
                        Text(
                          '${product.condition}',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    SizedBox(height: 10),
                    Text(
                      'Deskripsi',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      product.description,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.all(24),
              width: double.infinity,
              height: 37,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.blue,
                  width: 1.5,
                ),
              ),
              child: TextButton(
                onPressed: () {
                  // Aksi ketika tombol ditekan
                },
                child: Text(
                  'Chat',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

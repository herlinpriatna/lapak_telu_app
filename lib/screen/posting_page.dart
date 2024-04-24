import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(PostingProduk());

class PostingProduk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Posting produk page';
    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  XFile? _image; // Variabel untuk menyimpan gambar yang dipilih
  final picker = ImagePicker(); // Instance dari ImagePicker
  String? selectedCategory;

  // Daftar kategori produk untuk dropdown
  final List<String> categories = ['Elektronik', 'Pakaian', 'Makanan', 'Buku'];

  void validateInput() {
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Berhasil menyipana")));
    }
  }

  Future pickImage(ImageSource source) async {
    // Untuk memilih gambar dari galeri
    try {
      final pickedFile = await picker.pickImage(source: source);

      setState(() {
        if (pickedFile != null) {
          _image = pickedFile;
        } else {
          print('No image selected.');
        }
      });
    } catch (e) {
      print('Error occurred while picking image: $e');
    }
  }

  Widget imagePreview() {
    // Untuk Mengpreview gambar yang sudah di upload
    if (_image != null) {
      return Image.file(File(_image!.path),
          fit: BoxFit.cover, width: double.infinity, height: 150);
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.camera_alt,
              size: 50, color: const Color.fromRGBO(117, 117, 117, 1)),
          SizedBox(height: 8),
          Text("Tap untuk upload foto",
              style: TextStyle(color: Color(0xFF616161))),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldMessengerKey,
      appBar: AppBar(
          title: Center(
              child: Text("Posting Produk",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold))),
          backgroundColor: Colors.blue,
          automaticallyImplyLeading: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // NAMA PRODUK
                Text("Nama Produk",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),

                SizedBox(height: 15),
                Container(
                  margin: EdgeInsets.only(bottom: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextFormField(
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: "Masukan nama produk",
                      filled: true,
                      fillColor: Colors.transparent,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15.0),
                    ),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Nama barang tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                ),

                // DESKRIPSI PRODUK
                Text("Deskripsi Produk",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 15),

                Container(
                  margin: EdgeInsets.only(bottom: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Masukan deskripsi produk",
                      filled: true,
                      fillColor: Colors.transparent,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15.0),
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: 3,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Deskripsi produk tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                ),

                // KATEGORI`
                Text('Kategori',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 15),
                // Dropdown untuk Kategori Produk
                Container(
                  margin: EdgeInsets.only(bottom: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15.0),
                    ),
                    value: selectedCategory,
                    hint: Text("Pilih Kategori Produk"),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCategory = newValue!;
                      });
                    },
                    items: categories
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),

                // HARGA
                Text(
                  'Harga',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),
                Container(
                  margin: EdgeInsets.only(bottom: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Masukan Harga Produk",
                      filled: true,
                      fillColor: Colors.transparent,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15.0),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(
                          RegExp(r'[0-9]')), // Hanya memperbolehkan angka
                    ],
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Harga produk tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                ),

                // STOK PRODUK
                Text(
                  'Stok',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),
                Container(
                  margin: EdgeInsets.only(bottom: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Jumlah produk",
                      filled: true,
                      fillColor: Colors.transparent,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15.0),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(
                          RegExp(r'[0-9]')), // Hanya memperbolehkan angka
                    ],
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Harga produk tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 15),

                InkWell(
                  onTap: () {
                    // Tampilkan dialog untuk memilih dari Kamera atau Galeri
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return SafeArea(
                          child: Wrap(
                            children: <Widget>[
                              ListTile(
                                leading: new Icon(Icons.photo_library),
                                title: new Text('Galeri'),
                                onTap: () {
                                  pickImage(ImageSource.gallery);
                                  Navigator.of(context).pop();
                                },
                              ),
                              ListTile(
                                leading: new Icon(Icons.photo_camera),
                                title: new Text('Kamera'),
                                onTap: () {
                                  pickImage(ImageSource.camera);
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child:
                        imagePreview(), // Memanggil fungsi untuk menampilkan gambar
                  ),
                ),

                //Tombol Validasi Data
                Center(
                  child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SizedBox(
                          width: 220,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: validateInput,
                            child: Text(
                              'Upload',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                // Desain Button
                                backgroundColor: Colors.blue,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

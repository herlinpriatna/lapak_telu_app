import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class PostingProduk extends StatefulWidget {
  @override
  _PostingProduk createState() => _PostingProduk();
}

class _PostingProduk extends State<PostingProduk> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  // Menambahkan variabel untuk menyimpan kategori produk yang dipilih
  String? selectedCategory;

  // Daftar kategori produk untuk dropdown
  final List<String> categories = ['Elektronik', 'Pakaian', 'Makanan', 'Buku'];

  void validateInput() {
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Proses validasi sukses")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldMessengerKey,
      appBar: AppBar(
        title: Text(
          "Posting Produk",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                
                // NAMA PRODUK
                Text(
                  "Nama Produk", 
                  style: TextStyle(
                    fontSize: 16, 
                    fontWeight: FontWeight.bold
                   )
                ),

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
                Text(
                  "Deskripsi Produk", 
                  style: TextStyle(fontSize: 16, 
                  fontWeight: FontWeight.bold)),
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
                Text('Kategori', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
                    items: categories.map<DropdownMenuItem<String>>((String value) {
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
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), // Hanya memperbolehkan angka
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
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), // Hanya memperbolehkan angka
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
                  // Tempatkan logika untuk memilih foto dari galeri atau kamera
                  // Misalnya, menggunakan package seperti image_picker untuk memilih foto
                },
                child: Container(
                  height: 150, // Atur tinggi
                  width: double.infinity, // Atur lebar, double.infinity untuk lebar maksimal dalam parent
                  decoration: BoxDecoration(
                    color: Colors.black12, // Warna latar belakang kotak
                    borderRadius: BorderRadius.circular(12), // Radius border kotak
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center, // Pusatkan ikon dan teks secara vertikal
                    children: <Widget>[
                      Icon(Icons.camera_alt, size: 50, color: const Color.fromRGBO(117, 117, 117, 1)), // Ikon kamera
                      SizedBox(height: 8), // Jarak antara ikon dan teks
                      Text("Tap untuk upload foto", style: TextStyle(color: Color(0xFF616161))), // Teks
                    ],
                  ),
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
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          )
                        ),
                      )
                    )
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
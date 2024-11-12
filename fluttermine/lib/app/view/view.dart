import 'package:flutter/material.dart';
import 'package:fluttermine/app/model/image.dart';
import 'package:fluttermine/app/view/Gabungan.dart';
import 'package:fluttermine/app/view/crudpage.dart';
import 'package:fluttermine/app/view/konstan.dart';
import 'package:fluttermine/app/view/logoutpage.dart';
import 'package:fluttermine/app/view/pict.dart';
import 'package:fluttermine/app/view/register_page.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttermine/app/controller/controller.dart';
import 'package:fluttermine/app/view/list_foto_page.dart';
import 'package:fluttermine/app/view/WebViewPage.dart';
import 'package:fluttermine/app/view/accpage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 126, 201, 255),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Selamat Datangg",
                  style:
                      textTextStyle.copyWith(fontSize: 30, fontWeight: bold)),
              const SizedBox(height: 11),
              Text(
                "Lorem ipsum",
                style: secondaryTextStyle.copyWith(fontSize: 12),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 64,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Email",
                    style:
                        textTextStyle.copyWith(fontSize: 12, fontWeight: bold),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: whiteColor,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: ("aldiiiiii@gmail.com"),
                          hintStyle: textTextStyle.copyWith(
                              fontSize: 12, color: textColor.withOpacity(0.6)),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 17)),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Password",
                    style:
                        textTextStyle.copyWith(fontSize: 12, fontWeight: bold),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: whiteColor,
                    ),
                    child: const TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 17),
                            suffixIcon: Icon(Icons.visibility_off))),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 17,
                        height: 24,
                        decoration: BoxDecoration(
                            color: buttonColor,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Ingat saya",
                        style: greyTextStyle.copyWith(fontSize: 12),
                      )
                    ],
                  ),
                  Text(
                    "Lupa password ?",
                    style: textTextStyle.copyWith(fontSize: 12),
                  )
                ],
              ),
              Container(
                  width: double.infinity,
                  height: 59,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: primaryButtonColor),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage()));
                    },
                    child: Text(
                      "BELUM DAFTAR YA ????",
                      style: whiteTextStyle.copyWith(fontWeight: bold),
                    ),
                  )),
              const SizedBox(
                height: 15,
              ),
              Container(
                  width: double.infinity,
                  height: 59,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: primaryButtonColor),
                    onPressed: () {
                      Navigator.push(
                          context,
                          // MaterialPageRoute(builder: (context) => Login()));
                          MaterialPageRoute(
                              builder: (context) => SignupPage()));
                    },
                    child: Text(
                      "Login",
                      style: whiteTextStyle.copyWith(fontWeight: bold),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
// ... (your existing code for the LoginPage)

class LoginPage2 extends StatelessWidget {
  final LoginController controller = LoginController();
  // final AuthController _authController = Get.put(AuthController());

  LoginPage2({Key? key}) : super(key: key);

  Future<void> _pickImage(ImageSource source, BuildContext context) async {
    await controller.pickImage(source);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ListFotoPage(
          takenImages: controller.takenImages,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 126, 201, 255),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                const SizedBox(
                  height: 64,
                ),
                Column(
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: ("Pilih"),
                          hintStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.black.withOpacity(0.6),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 17,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: ("Jakarta, Indonesia"),
                          hintStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.black.withOpacity(0.6),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 17,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 59,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 19,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
                    onPressed: () {
                      Get.to(
                          const UploadImageWidget()); // Ganti dengan nama halaman yang sesuai
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          "https://image.similarpng.com/very-thumbnail/2020/06/Logo-google-icon-PNG.png",
                          height: 20,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          "Take a picture",
                          style: textTextStyle.copyWith(fontWeight: bold),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20), // Add spacing
                Container(
                  width: double.infinity,
                  height: 200, // Adjust the height as needed
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:
                      const ImageWidget(), // Replace with your image widget or implementation
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
            backgroundColor: Color.fromARGB(255, 0, 0, 0),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            backgroundColor: Colors.black,
            label: 'Take Photo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'List Foto',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Show Article',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.web),
            label: 'Buka WebView',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Logout'),
          BottomNavigationBarItem(
            icon: Icon(Icons.storage), // Icon untuk tombol baru
            label: 'Storage',
          )
          // New BottomNavigationBarItem for CountriesView
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              _pickImage(ImageSource.gallery, context);
              break;
            case 1:
              _pickImage(ImageSource.camera, context);
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListFotoPage(
                    takenImages: controller.takenImages,
                  ),
                ),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(
                  // builder: (context) => UploadImageWidget(),
                  builder: (context) => const ApiWidget(),
                ),
              );
              break;
            case 4:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const WebViewPage(url: 'https://www.sribu.com/en'),
                ),
              );
              break;
            case 5:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ));
            case 6: // Indeks untuk tombol baru
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CrudScreen(),
                ),
              );
              break;
          }
        },
      ),
    );
  }
}

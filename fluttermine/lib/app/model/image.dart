import 'package:flutter/widgets.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://image.similarpng.com/very-thumbnail/2020/06/Logo-google-icon-PNG.png', // Replace with your image URL
      fit: BoxFit.cover, // Adjust the fit as needed
    );
  }
}

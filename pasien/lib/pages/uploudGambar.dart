import 'dart:io';
import 'package:antre/pages/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UploadImageScreen extends StatefulWidget {
  @override
  _UploadImageScreenState createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  final picker = ImagePicker();
  File? imageFile;

  Future<String?> uploadImageToFirebase(File imageFile) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference ref = FirebaseStorage.instance.ref().child('images/$fileName');
      await ref.putFile(imageFile);

      // Dapatkan URL unduhan Foto BPJS Anda
      String downloadUrl = await ref.getDownloadURL();
      return downloadUrl;
    } catch (error) {
      print('Error uploading image: $error');
      return null;
    }
  }

  Future<void> _getImageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _getImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _uploadImage() async {
    if (imageFile != null) {
      String? downloadUrl = await uploadImageToFirebase(imageFile!);
      if (downloadUrl != null) {
        // Foto BPJS Anda berhasil diunggah, lakukan tindakan selanjutnya
        print('Download URL: $downloadUrl');
      } else {
        // Gagal mengunggah Foto BPJS Anda
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Image'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          imageFile != null
              ? Image.file(
                  imageFile!,
                  width: 200,
                  height: 200,
                )
              : Placeholder(
                  fallbackHeight: 200,
                  fallbackWidth: 200,
                ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _getImageFromCamera,
            child: Text('Ambil Foto BPJS Anda'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: _getImageFromGallery,
            child: Text('Pilih Foto BPJS Anda'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _uploadImage,
            child: Text('Unggah'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignInScreen()),
              );
            },
            child: Text('Masuk'),
          ),
        ],
      ),
    );
  }
}

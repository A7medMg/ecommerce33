import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shoppapp/core/consstans/color/colorapp.dart';

class HomeScreenClaas extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenClaas> {
  File? _image;
  final picker = ImagePicker();
  String _animalType = '';
  String _errorMessage = '';

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _uploadImage() async {
    if (_image == null) return;

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://192.168.43.159:5000/predict'),
    );
    request.files.add(await http.MultipartFile.fromPath('file', _image!.path));

    var res = await request.send();
    final respStr = await res.stream.bytesToString();

    if (res.statusCode == 200) {
      try {
        final decodedResponse = json.decode(respStr);
        setState(() {
          _animalType = decodedResponse['breed'];
          _errorMessage = '';
        });
      } catch (e) {
        setState(() {
          _errorMessage = 'Failed to decode response';
        });
        print('Failed to decode response: $e');
      }
    } else {
      setState(() {
        _errorMessage = 'Error: ${res.statusCode}';
      });
      print('Error: ${res.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animal Identifier'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image == null
                ? Text('No image selected.')
                : Image.file(_image!),
            SizedBox(height: 20),
            Container(
              height: 70,
              width: 120,
              decoration: BoxDecoration(
                color: Colorapp.primaryColor,
                borderRadius: BorderRadius.circular(17)
              ),
              child: ElevatedButton(
                onPressed: _pickImage,
                child: Text('Pick Image'),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 70,
              width: 120,
              decoration: BoxDecoration(
                  color: Colorapp.primaryColor,
                  borderRadius: BorderRadius.circular(17)
              ),
              child: ElevatedButton(

                onPressed: _uploadImage,
                child: Text('Upload Image'),
              ),
            ),
            SizedBox(height: 20),
            Text(
              _animalType.isEmpty ? _errorMessage : 'Animal: $_animalType',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
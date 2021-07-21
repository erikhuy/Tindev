import 'package:flutter/material.dart';
import 'package:tindev/theme/colors.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';

class AddImageProfile extends StatefulWidget {
  AddImageProfileState createState() => AddImageProfileState();
}

class AddImageProfileState extends State<AddImageProfile> {
  File _image;
  Uint8List memoryImage;
  

  Future getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile == null) return;

    if (_image != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    } else {
      final bytes = await pickedFile.readAsBytes();

      setState(() {
        memoryImage = bytes;
      });
    }

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected');
      }
    });
  }

  // Widget buildFileImage() => Image.file(_image);
  // Widget buildMemoryImage() => Image.memory(memoryImage);
  Widget buildFileImage() => Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.blue[600],
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.015),
        width: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.width * 0.4,
        child: Image.file(_image,fit: BoxFit.fitHeight,),
      );
  Widget buildMemoryImage() => Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.blue[600],
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.015),
        width: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.width * 0.4,
        child: Image.memory(memoryImage,fit: BoxFit.fitHeight,),
      );
  Widget buidNormalPicker() => Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.blue[600],
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.015),
        width: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.width * 0.4,
      );

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          Container(
            width: width * 0.31,
            height: width * 0.41,
            child: Stack(
              children: [
                if (_image != null) buildFileImage(),
                memoryImage != null ? buildMemoryImage() : buidNormalPicker(),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                      width: width * 0.08,
                      height: width * 0.08,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: white,
                          boxShadow: [
                            BoxShadow(
                              color: grey.withOpacity(0.1),
                              spreadRadius: 5,
                              blurRadius: 5,
                            ),
                          ]),
                      child: _image == null
                          ? Center(
                              child: GestureDetector(
                              onTap: () {
                                getImage();
                              },
                              child: Icon(Icons.add, color: Colors.blue[600]),
                            ))
                          : Center(
                              child: GestureDetector(
                              // onTap: () {
                              //   cancle Image
                              // },
                              child: Icon(Icons.close, color: Colors.blue[600]),
                            ))),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

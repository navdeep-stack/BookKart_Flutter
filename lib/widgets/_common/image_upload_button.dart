import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploadButton extends StatelessWidget {
  ValueNotifier<XFile?> imageNotifier = ValueNotifier(null);
  String? previousImage;
  ImageUploadButton({
    Key? key,
    required this.imageNotifier,
    this.previousImage,
  }) : super(key: key);

  _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imageNotifier.value = image;
      imageNotifier.value = XFile(image.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        ValueListenableBuilder(
          valueListenable: imageNotifier,
          builder: (BuildContext context, dynamic value, Widget? child) {
            return Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: value != null
                  ? Image.file(
                      File(value!.path),
                      width: 150,
                      height: 150,
                    )
                  : Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          image: DecorationImage(
                            image: NetworkImage(
                              previousImage ??
                                  "https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg",
                            ),
                            fit: BoxFit.fill,
                          )),
                    ),
            );
          },
        ),
        InkWell(
          onTap: _pickImage,
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white, shape: BoxShape.circle),
            child: const Padding(
              padding: EdgeInsets.all(2.0),
              child: Icon(
                Icons.camera_alt,
                color: Colors.black,
                size: 30.0,
                semanticLabel: 'Add your photo',
              ),
            ),
          ),
        )
      ],
    );
  }
}

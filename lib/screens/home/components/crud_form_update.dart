import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shop_app/components/toast.dart';
import 'package:image_picker/image_picker.dart';


void showCustomDialogUpdate(BuildContext context) {
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _idController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _ratingController = TextEditingController();
  TextEditingController _titleController = TextEditingController();
  bool? _selectedValue;
  bool? _favouriteValue;
  File? _image;

  final ImagePicker _picker = ImagePicker();

  
  Future<void> _pickImage(StateSetter setState) async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }
  Future uploadFile() async {
    if (_image == null) return;
    String fileName = _idController.text;
    Reference storageRef = FirebaseStorage.instance.ref().child('product/$fileName');

    try {
      await storageRef.putFile(_image!);
      
    } catch (e) {
      showToast(message: 'Upload Failed');
    }
  }
  Future addUserInfo() async {
    try {
      
      await FirebaseFirestore.instance.collection('product').doc(_idController.text).set({
        'description':_descriptionController.text,
        'favourite':_favouriteValue,
        'id':int.parse(_idController.text),
        'images':"https://firebasestorage.googleapis.com/v0/b/jazzorjas-4a781.appspot.com/o/product%2F${_idController.text}?alt=media&token=819875f3-3241-4bdb-87e4-8d356021cf91",
        'popular':_selectedValue,
        'price':int.parse(_priceController.text),
        'rating':int.parse(_ratingController.text),
        'title':_titleController.text,
      });
      
      
      
      
    }on FirebaseAuthException catch (e){
      showToast(message: e.message.toString());
    }
  }
  void checkform() async {
    // Get a reference to the Firestore database
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Reference to your collection
    CollectionReference collectionRef = firestore.collection('product');

    // Query to check if any document has 'id' equal to 2
    QuerySnapshot querySnapshot = await collectionRef.where('id', isEqualTo: int.parse(_idController.text)).get();

    if (querySnapshot.docs.isNotEmpty) {
      // At least one document found with id equal to 2
      uploadFile();
      addUserInfo();
      showToast(message: 'Product updated');
      
    } else {
      // No document found with id equal to 2
      showToast(message: 'Item with ID ${_idController.text} not exist');
      
      
    }
  }
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            scrollable: true,
            backgroundColor: Colors.black,
            title: const Text(
              "Create",
              style: TextStyle(color: Colors.white),
            ),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _titleController,
                      decoration: const InputDecoration(
                        labelText: "Title",
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _descriptionController,
                      decoration: const InputDecoration(
                        labelText: "description",
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 20),
                    DropdownButtonFormField<bool>(
                      decoration: const InputDecoration(
                        labelText: 'favourite',
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                      ),
                      value: _favouriteValue,
                      items: const [
                        DropdownMenuItem(
                          value: true,
                          child: Text('True'),
                        ),
                        DropdownMenuItem(
                          value: false,
                          child: Text('False'),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _favouriteValue = value;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Popular';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          _favouriteValue = value;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _idController,
                      decoration: const InputDecoration(
                        labelText: "id",
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 20),
                    DropdownButtonFormField<bool>(
                      decoration: const InputDecoration(
                        labelText: 'Popular',
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                      ),
                      value: _selectedValue,
                      items: const [
                        DropdownMenuItem(
                          value: true,
                          child: Text('True'),
                        ),
                        DropdownMenuItem(
                          value: false,
                          child: Text('False'),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedValue = value;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Please select a value';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          _selectedValue = value;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _priceController,
                      decoration: const InputDecoration(
                        labelText: "price",
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _ratingController,
                      decoration: const InputDecoration(
                        labelText: "rating",
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => _pickImage(setState),
                      child: const Text("Pick Image"),
                    ),
                    const SizedBox(height: 20),
                    if (_image != null)
                      Image.file(
                        _image!,
                        height: 100,
                      ),
                    
                    
                  ],
                ),
              ),
            ),
            actions: [
              ElevatedButton(
                child: const Text("Submit"),
                onPressed: () {
                  // Handle submit action here
                  // For example, you can show a toast with the name entered
                  //_image != null
                  if (_titleController.text.isNotEmpty){
                    if(_descriptionController.text.isNotEmpty){
                      if(_idController.text.isNotEmpty){
                        if(int.tryParse(_priceController.text) != null){
                          if(int.tryParse(_ratingController.text) != null){
                            if(_image != null){
                              checkform();
                            }else{
                              showToast(message: 'Must pick image');
                            }
                          }else{
                            showToast(message: 'rating cannot be empty and must integer');
                          }
                        }else{
                          showToast(message: 'price cannot be empty and must integer');
                        }
                      }else{
                        showToast(message: 'ID cannot be empty');
                      }
                    }else{
                      showToast(message: 'Description cannot be empty');
                    }
                  }else{
                    showToast(message: 'Title cannot be empty');
                  }
                  //checkform();
                  // Close the dialog
                  
                },
              ),
            ],
          );
        },
      );
    },
  );
}

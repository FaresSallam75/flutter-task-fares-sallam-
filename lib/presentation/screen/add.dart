import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:task/constants/sqflite_db.dart';
import 'package:task/presentation/widget/custommaterialbutton.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  SqlDatabase db = SqlDatabase();

  File? file;

  Future<File?>? takePhotoWithGallery() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      return File(result.files.single.path!);
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Screen")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomMaterialButton(
            color: Colors.blue,
            height: 50,
            minWidth: 200,
            onPressed: () async {
              int response = await db.insertData(
                '''INSERT INTO 'rooms' ('type','number_room','payment_type','property_condition','categories_id') 
                VALUES (' ','3','','','5')''',
              );
              file = null;
              print("response ======================== $response");
            },
            radius: 8,
            child: const Text("Add", style: TextStyle(color: Colors.white)),
          ),
          CustomMaterialButton(
            color: Colors.blue,
            height: 50,
            minWidth: 200,
            onPressed: () async {
              List<Map> response = await db.readData(
                '''SELECT * FROM 'rooms' ''',
              );
              print("response ======================== $response");
            },
            radius: 8,
            child: const Text("Read", style: TextStyle(color: Colors.white)),
          ),
          CustomMaterialButton(
            color: Colors.blue,
            height: 50,
            minWidth: 200,
            onPressed: () async {
              file = await takePhotoWithGallery();
              if (kDebugMode) {
                print("file ===================== $file");
              }
            },
            radius: 8,
            child: const Text("delete", style: TextStyle(color: Colors.white)),
          ),

          CustomMaterialButton(
            color: Colors.blue,
            height: 50,
            minWidth: 200,
            onPressed: () async {
              file = await takePhotoWithGallery();
              print("file ===================== $file");
              print("file path ===================== ${file!.path}");
            },
            radius: 8,
            child: const Text(
              "Select Imge",
              style: TextStyle(color: Colors.white),
            ),
          ),

          CustomMaterialButton(
            color: Colors.blue,
            height: 50,
            minWidth: 200,
            onPressed: () async {
              List<Map> response = await db.readData(
                '''update 'rooms' SET number_room = '2'  where id = 4 ''',
              );
              file = null;

              print("response ======================== $response");
            },
            radius: 8,
            child: const Text("update", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

/* 
 
 [[{id: 5, name: عقارات, image: 7454792ee9714c29e87721d609d750dcad0f28b8.jpg},
  {id: 4, name: منتجات تجميل, image: aa10eae405657f831bc1879e160e36a0ac7ed48d.png},
  {id: 3, name: موبايلات, image: 1f354408102923fd6961cb072d4ea3a8b2758844.png},
  {id: 2, name: ساعات, image: d5b316d3502d78a465c435b34fa8e70925fcc045.png},
  {id: 1, name: موضة رجالى, image: 24b0962276e50c480329714a01704f0b21e03eac.png}]

 */

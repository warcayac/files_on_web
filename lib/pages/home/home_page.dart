import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/file_service.dart';


class HomePage extends StatelessWidget {
  /* ---------------------------------------------------------------------------- */
  const HomePage({Key? key}) : super(key: key);
  /* ---------------------------------------------------------------------------- */
  @override
  Widget build(BuildContext context) {
    var file = FileService();

    return Scaffold(
      appBar: AppBar(
        title: Text('Handle files on Web'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                OutlinedButton(
                  onPressed: file.readContentFromFile, 
                  child: Text('Load lyrics'),
                ),
                SizedBox(width: 10),
                OutlinedButton(
                  onPressed: file.replaceVocals, 
                  child: Text('Replace Vocals'),
                ),
                SizedBox(width: 10),
                OutlinedButton(
                  onPressed: file.saveToFile, 
                  child: Text('Save to file'),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: Obx(() => Text(file.content.value, style: TextStyle(fontSize: 16))),
            ),
          ],
        ),
      ),
    );
  }
  /* ---------------------------------------------------------------------------- */
}

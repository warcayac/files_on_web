import 'dart:convert';
import 'dart:typed_data';

import 'package:file_selector/file_selector.dart' as fs;
import 'package:get/get.dart';


class FileService extends GetxController {
  var content = ''.obs;
  final typeGroup = fs.XTypeGroup(label: 'text', extensions: ['txt','json']);
  /* ---------------------------------------------------------------------------- */
  FileService();
  /* ---------------------------------------------------------------------------- */
  void readContentFromFile() async {
    var file = await fs.openFile(acceptedTypeGroups: [typeGroup]);
    content.value = (await file?.readAsString()) ?? '';
  }
  /* ---------------------------------------------------------------------------- */
  void replaceVocals() {
    content.value = content.replaceAll(RegExp(r'(?<=Vocals: ).*'), 'Ουιλιαμ Αρκευα');
  }
  /* ---------------------------------------------------------------------------- */
  void saveToFile() async {
    // fs.getSavePath is not working on Web
    var output = fs.XFile.fromData(
      Uint8List.fromList(utf8.encode(content.value)),
      name: 'fromWeb.txt',
      mimeType: 'text/plain',
    );

    await output.saveTo('./');
  }
  /* ---------------------------------------------------------------------------- */
}
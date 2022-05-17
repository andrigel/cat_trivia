import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<Image?> loadNetworkImage() async
{
  try{
  const url = 'https://cataas.com/cat';
  final ByteData imageData = await NetworkAssetBundle(Uri.parse(url)).load('');
  final Uint8List bytes = imageData.buffer.asUint8List();
  return Image.memory(bytes);
  }catch(e){
    print(e);
    return null;
  }
}
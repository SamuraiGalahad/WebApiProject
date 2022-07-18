import 'dart:math';
import 'package:flutter/material.dart';

import 'pet.dart';
import 'pet_page.dart';

const catalogLength = 200;

/// This function emulates a REST API call. You can imagine replacing its
/// contents with an actual network call, keeping the signature the same.
///
/// It will fetch a page of items from [startingIndex].
Future<PetPage> fetchPage(int startingIndex) async {
  // We're emulating the delay inherent to making a network call.
  await Future<void>.delayed(const Duration(milliseconds: 500));

  // If the [startingIndex] is beyond the bounds of the catalog, an
  // empty page will be returned.
  if (startingIndex > catalogLength) {
    return PetPage(
      items: [],
      startingIndex: startingIndex,
      hasNext: false,
    );
  }
  String generateType(){
    var r = Random().nextInt(2);
    if (r==0) {
      return 'Cat';
    } else {
      return 'Dog';
    }
  }
  Image generateImage(String type){
    if (type=="Dog"){
      return Image.asset("lib/images/dog.jpg");
    }
    else{
      return Image.asset("lib/images/cat.jpg");
    }
  }
  var type = generateType();
  // The page of items is generated here.
  return PetPage(
    items: List.generate(
        min(itemsPerPage, catalogLength - startingIndex),
            (index) => Pet(
          type: type,
          name: 'Lera',
          image: generateImage(type)
        )),
    startingIndex: startingIndex,
    // Returns `false` if we've reached the [catalogLength].
    hasNext: startingIndex + itemsPerPage < catalogLength,
  );
}
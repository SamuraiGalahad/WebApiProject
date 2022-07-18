import 'pet.dart';

const int itemsPerPage = 20;

class PetPage {
  final List<Pet> items;

  final int startingIndex;

  final bool hasNext;

  PetPage({
    required this.items,
    required this.startingIndex,
    required this.hasNext,
  });
}
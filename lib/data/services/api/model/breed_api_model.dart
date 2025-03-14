class Breed {
  final String breedName;
  final List<String> subBreeds;
  final String image;

  Breed({required this.breedName, this.subBreeds = const [], this.image = ""});

  factory Breed.fromJson(Map<String, dynamic> json) {
    return Breed(
      breedName: json['breedName'],
      subBreeds:
          json['subBreeds'] != null ? List<String>.from(json['subBreeds']) : [],
      image: json['image'] ?? "",
    );
  }
}

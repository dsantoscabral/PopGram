class PopPerson {
  final int personId;
  final String name;
  final String profilePhotoUri;

  PopPerson(
      {this.personId,
        this.name,
        this.profilePhotoUri});

  factory PopPerson.fromJson(Map<String, dynamic> json) {
    return PopPerson(
      personId: json['personId'],
      name: json['name'],
      profilePhotoUri: json['profilePhotoUri'],
    );
  }
}

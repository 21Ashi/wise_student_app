class Books{
  String? id;
  String? title;
  String? author;
  String? category;
  String? description;
  String? pages;
  String? language;
  String? release;
  String? image;
  List? members;

  

  Books({
    required this.id,
    required this.title,
    required this.author,
    required this.category,
    required this.description,
    required this.pages,
    required this.language,
    required this.release,
    required this.image,
    required this.members,
  });

  factory Books.fromJson(Map<String,dynamic>json){
    return Books(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      category: json['category'],
      description: json['description'],
      pages: json['pages'],
      language: json['language'],
      release: json['release'],
      image: json['image'],
      members: json['members'],
      
    );
  }

  Map<String,dynamic> toJson(){
    return {
      'id':id,
      'title':title,
      'author':author,
      'category' :category,
      'description':description,
      'pages':pages,
      'language':language,
      'release':release,
      'image':image,
      'members':members ?? [],
    };
  }
}
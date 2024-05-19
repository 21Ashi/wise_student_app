class Std{
  String? id;
  String? stdId;
  String? fname;
  String? degree;
  String? major;
  String? academicAdvisor;
  String? stdEmail;
  String? phoneNumber;
  String? eLearningPass;
  String? teamsPass;
  String? image;
  String? lastActivated;
  String? pushToken;
  bool? online;
  List? myUsers;

  Std({
    required this.id,
    required this.stdId,
    required this.fname,
    required this.degree,
    required this.major,
    required this.academicAdvisor,
    required this.stdEmail,
    required this.phoneNumber,
    required this.eLearningPass,
    required this.teamsPass,
    required this.image,
    required this.lastActivated,
    required this.pushToken,
    required this.online,
    required this.myUsers,
  });

  factory Std.fromJson(Map<String,dynamic>json){
    return Std(
      id: json['id'],
      stdId: json['std_id'],
      fname: json['fname'],
      degree: json['degree'], 
      major: json['major'],
      academicAdvisor: json['academic_advisor'], 
      stdEmail: json['std_email'],
      phoneNumber: json['phone_number'], 
      eLearningPass: json['eLearning_pass'],
      teamsPass: json['teams_pass'], 
      image: json['image'], 
      lastActivated: json['last_activated'], 
      pushToken: json['push_token'],
      online: json['online'],
      myUsers: json['my_users'],
      
    );
  }

  Map<String,dynamic> toJson(){
    return {
      'id':id,
      'std_id':stdId,
      'fname':fname,
      'degree':degree,
      'major':major,
      'academic_advisor':academicAdvisor,
      'std_email':stdEmail,
      'phone_number':phoneNumber,
      'eLearning_pass':eLearningPass,
      'teams_pass':teamsPass,
      'image':image,
      'last_activated':lastActivated,
      'push_token':pushToken,
      'online':online,
      'my_users':myUsers,
    };
  }
}
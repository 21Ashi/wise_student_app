class ChatGroup{
  String? id;
  String? name;
  List ? members;
  List ? admins;
  String? lastMessage;
  String? lastMessageTime;
  String? createdAt;
  

  ChatGroup({
    required this.id,
    required this.name,
    required this.members,
    required this.admins,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.createdAt,
  });

  factory ChatGroup.fromJson(Map<String,dynamic>json){
    return ChatGroup(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      members: json['members'] ?? [],
      admins: json['admins'] ?? [],
      lastMessage: json['last_message'] ?? "",
      lastMessageTime: json['last_message_time'] ?? "",
      createdAt: json['created_at'],
      
    );
  }

  Map<String,dynamic> toJson(){
    return {
      'id':id ,
      'name':name ,
      'members':members,
      'admins':admins,
      'last_message' :lastMessage ,
      'last_message_time':lastMessageTime,
      'created_at':createdAt,
    };
  }
}
class StudentTable{
  String ? stdId;
  String ? cId;
  String? courseName;
  String? period;
  String? days;
  String? location;
  String? instructorName;
  String? creditHours;

  StudentTable({
    required this.stdId,
    required this.cId,
    required this.courseName,
    required this.period,
    required this.days,
    required this.location,
    required this.instructorName,
    required this.creditHours,
  });

  factory StudentTable.fromJson(Map<String,dynamic>json){
    return StudentTable(
      stdId: json['std_id'],
      cId: json['course_id'],
      courseName: json['course_name'],
      period: json['period'], 
      days: json['days'],
      location: json['location'], 
      instructorName: json['instructor_name'],
      creditHours: json['credit_hours'],
      
    );
  }

  Map<String,dynamic> toJson(){
    return {
      'std_id':stdId,
      'course_id':cId,
      'course_name':courseName,
      'period':period,
      'days':days,
      'location':location,
      'instructor_name':instructorName,
      'credit_hours':creditHours,
    };
  }
}
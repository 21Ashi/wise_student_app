class Marks{
  String? markId;
  String? markSy;
  String? stdId;
  String? firstMark;
  String? secondMark;
  String? semesterWorkMark;
  String? finalMark;
  String? total;
  String? midTotal;
  String? note;
  String? courseId;

  Marks({
    required this.markId,
    required this.markSy,
    required this.stdId,
    required this.firstMark,
    required this.secondMark,
    required this.semesterWorkMark,
    required this.finalMark,
    required this.total,
    required this.midTotal,
    required this.note,
    required this.courseId,
  });

  factory Marks.fromJson(Map<String,dynamic>json){
    return Marks(
      markId: json['mark_id'],
      markSy: json['mark_symbol'],
      stdId: json['std_id'],
      firstMark: json['first_mark'],
      secondMark: json['second_mark'],
      semesterWorkMark: json['semester_work_mark'],
      finalMark: json['final_mark'],
      total: json['total'],
      midTotal: json['mid_total'],
      note: json['note'],
      courseId: json['course_id'],      
    );
  }

  Map<String,dynamic> toJson(){
    return {
      'mark_id':markId,
      'mark_symbol':markSy,
      'std_id':stdId,
      'first_mark':firstMark,
      'second_mark':secondMark,
      'semester_work_mark':semesterWorkMark,
      'final_mark':finalMark,
      'total':total,
      'mid_total':midTotal,
      'note':note,
      'course_id':courseId,
    };
  }
}
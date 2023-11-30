class Lessons {
  var id;

  var name;

  var description;

  var attachmentsUrls;

  var passed;

  var countBlocks;

  var countStudents;

  var countLessons;

  var createdAt;

  var updatedAt;

  // /v1/lesson/{lessonId}/template
  Lessons({
    //required this.id,
    required this.name,
    required this.description,
    /*required this.attachmentsUrls,
    required this.passed,
    required this.countBlocks,
    required this.countStudents,
    required this.countLessons,
    required this.createdAt,
    required this.updatedAt,*/
  });

  /*"id": 0,
      "name": "string",
      "iconUrl": "string",
      "headerUrl": "string",
      "access": true,
      "status": "NOT_STARTED",
      "openCondition": "IMMEDIATELY",
      "openAt": "2023-11-29T23:06:13.871Z",
      "openAfterId": 0,
      "openAwaiting": 0,
      "isOpen": true
  * */

// ToDo
  /*factory Lesson.fromJson(Map<String, dynamic> json) {

  }*/
}
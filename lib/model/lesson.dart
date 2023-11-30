class Lesson {
  var id;

  var name;

  var iconUrl;

  var headerUrl;

  var attachmentsUrls;

  var status;

  var openCondition;

  var openAt;

  var openAfterId;

  var openAwaiting;

  var isOpen;

  // /v1/lesson/{lessonId}/template
  Lesson({
    required this.id,
    required this.name,
    required this.iconUrl,
    required this.headerUrl, //delete
    required this.attachmentsUrls,
    required this.status,
    required this.openCondition,
    required this.openAt,
    required this.openAfterId,
    required this.openAwaiting,
    required this.isOpen,
  });

  /*

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

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      // ToDo
        id: null,
        name: null,
        iconUrl: null,
        headerUrl: null,
        attachmentsUrls: null,
        status: null,
        openCondition: null,
        openAt: null,
        openAfterId: null,
        openAwaiting: null,
        isOpen: null
    );
  }
}
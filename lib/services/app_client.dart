//import 'file:///C:/Users/Cosmin/OneDrive/Documents/AndroidStudioProjects/drept_civil/lib/models/course.dart'; FIXME
import 'package:parse_server_sdk/parse_server_sdk.dart';

class AppClient {
  static const String _APPLICATION_ID = ""; //TODO
  static const String _CLIENT_KEY = ""; //TODO
  static const String _ENDPOINT = ""; //TODO

  ParseUser _currentUser;
  bool _isAuthenticated;

  static AppClient _instance;

  AppClient();

  static void initialize() async {
    _instance = AppClient();
    if (!Parse().hasParseBeenInitialized()) {
      await Parse().initialize(_APPLICATION_ID, _ENDPOINT,
          clientKey: _CLIENT_KEY,
          autoSendSessionId: true,
          debug: false //TODO REMOVE IN POST
          );
    }
  }

  static AppClient getInstance() {
    return _instance;
  }

  void test() async {
    var response = await ParseObject('Chapter').getAll();
    if (response.success) {
      print("Test succesful");
      for (var object in response.result) {
        print("Test object: " + object.toString());
      }
    } else {
      print("TEST FAILED");
    }
  }

  Future<bool> authenticate(String username, String password) async {
    _isAuthenticated = false;
    _currentUser = ParseUser.createUser(username, password, "");
    ParseResponse response = await _currentUser.login();
    if (response.success) {
      _currentUser = response.result;
      _isAuthenticated = true;
    }

    return _isAuthenticated;
  }

  Future<List<Map<String, String>>> retrieveChapters() async {
    var response = await ParseObject('Chapter').getAll();
    if (response.success) {
      List<Map<String, String>> chapters = [];
      List results = response.results;
      results.sort((a, b) =>
          a.get<int>('order_number').compareTo(b.get<int>('order_number')));
      for (var chapterObject in results) {
        Map<String, String> chapter = new Map();
        chapter["chapter_id"] = chapterObject.get<String>('objectId');
        chapter["order_number"] =
            chapterObject.get<int>('order_number').toString();
        chapter["name"] = chapterObject.get<String>('name');
        chapter["description"] = chapterObject.get<String>('description');
        chapters.add(chapter);
      }
      return chapters;
    } else {
      print("Failed to retrieve chapters");
      return null;
    }
  }

  Future<List<Map<String, String>>> retrieveCourses(int chapterId) async {
//    var queryBuilder = QueryBuilder<Course>(Course())
//      ..whereEqualTo(Course.keyChapterId, chapterId);
//    var response = await queryBuilder.query();
//    if (response.success) {
//      List<Map<String, String>> courses = [];
//      List results = response.results;
//      results.sort((a, b) =>
//          a.get<int>('order_number').compareTo(b.get<int>('order_number')));
//
//      for (var courseObject in results) {
//        Map<String, String> course = new Map();
//        course["id"] = courseObject.get<String>('objectId');
//        course["order_number"] =
//            courseObject.get<int>('order_number').toString();
//        course["name"] = courseObject.get<String>('name');
//        courses.add(course);
//      }
//      return courses;
//    } else {
//      print("Failed to retrieve courses for chapter $chapterId");
//      return null;
//    } TODO
  }

  Future<List<String>> retrieveCourseContents(String courseId) async {
    var response = await Course().getObject(courseId.toString());
    if (response.success) {
      var course = response.result;
      String content = course.get<String>('content');
      List<String> contents;
      if (content.contains("\r\n"))
        contents = course.get<String>('content').split("\r\n\r\n");
      else
        contents = course.get<String>('content').split("\n\n");
      return contents;
    } else {
      print("Failed to retrieve content for course $courseId");
      return null;
    }
  }

  Future<ParseResponse> signUp(String username, String password, String email) async {
    var user = ParseUser.createUser(username, password, email);

    var response = await user.signUp();
    return response;
  } //TODO HANDLE SAME EMAIL OR PASSWORD

  //TODO LOGOUT ON APP EXIT
  Future<bool> logout() async {
    if (_isAuthenticated) {
      ParseResponse response = await _currentUser.logout();
      return response.success;
    } else
      return true;
  }

  bool isAuthenticated() {
    return _isAuthenticated;
  }
}

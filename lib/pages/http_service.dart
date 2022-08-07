import 'dart:convert';

import 'package:final_project_app/pages/post_model.dart';
import 'package:http/http.dart';
import 'package:final_project_app/pages/homepage.dart';

class HttpService {
  final String postUrl =
      "https://edcd669b-b58f-4ba8-b993-b96dc357bbc8.mock.pstmn.io/" +
          DataSearch.last;
  Future<List<Post>> getPosts() async {
    Response res = await get(Uri.parse(postUrl));
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Post> posts =
          body.map((dynamic item) => Post.fromJson(item)).toList();
      return posts;
    } else {
      throw "can't get posts";
    }
  }
}

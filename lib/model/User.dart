import 'package:http/http.dart' as http;
import 'dart:convert';

class ResponseUser {
  Data data;
  Ad ad;

  ResponseUser({this.data, this.ad});

  ResponseUser.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    ad = json['ad'] != null ? new Ad.fromJson(json['ad']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    if (this.ad != null) {
      data['ad'] = this.ad.toJson();
    }
    return data;
  }

  static Future<ResponseUser> getUserFromApi(int id) async {
    String url = "https://reqres.in/api/users/"+id.toString();

    var response = await http.get(url);
    var jO = json.decode(response.body);
    var data = (jO as Map<String, dynamic>)['data'];
    var ad = (jO as Map<String, dynamic>)['ad'];

    ResponseUser result = ResponseUser(data: Data.fromJson(data), ad: Ad.fromJson(ad));
    return result;
  }
}

class Data {
  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  Data({this.id, this.email, this.firstName, this.lastName, this.avatar});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['avatar'] = this.avatar;
    return data;
  }
}

class Ad {
  String company;
  String url;
  String text;

  Ad({this.company, this.url, this.text});

  Ad.fromJson(Map<String, dynamic> json) {
    company = json['company'];
    url = json['url'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['company'] = this.company;
    data['url'] = this.url;
    data['text'] = this.text;
    return data;
  }
}

class UninitializedUser extends ResponseUser{}
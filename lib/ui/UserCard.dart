import 'package:flutter/material.dart';
import 'package:flutter_mvvm/model/User.dart';

class UserCard extends StatelessWidget {

  final ResponseUser responseUser;

  UserCard(this.responseUser);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x55000000),
            offset: Offset(1, 1),
            blurRadius: 7,
          ),
        ],
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.blueGrey),
      ),
      child: Row(
        children: [
          Container(
            width: 75,
            height: 75,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(responseUser.data.avatar),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("ID : "+responseUser.data.id.toString()),
              Text("Nama : "+responseUser.data.firstName),
              Text("Email : "+responseUser.data.email),
            ],
          )
        ],
      ),
    );
  }
}

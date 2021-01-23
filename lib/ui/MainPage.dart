import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mvvm/bloc/UserBloc.dart';
import 'package:flutter_mvvm/model/User.dart';
import 'package:flutter_mvvm/ui/UserCard.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MVVM"),
      ),
      body: ContentMainPage(),
    );
  }
}

class ContentMainPage extends StatelessWidget {
  const ContentMainPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserBloc bloc = BlocProvider.of<UserBloc>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RaisedButton(
          child: Text("Ambil Ramdom User"),
          onPressed: () {
            bloc.dispatch(Random().nextInt(10) + 1);
          },
        ),
        BlocBuilder<UserBloc, ResponseUser>(
            builder: (context, state) =>
                (state is UninitializedUser) ? emptyData() : UserCard(state)),
      ],
    );
  }

  Center emptyData() {
    return Center(
      child: Container(
        child: Text("Data belum ditemukan"),
      ),
    );
  }
}

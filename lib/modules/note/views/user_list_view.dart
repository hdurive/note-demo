import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:notish/core/models/Note.dart';
import 'package:notish/core/models/NoteType.dart';
import 'package:notish/core/models/User.dart';
import 'package:notish/generated/i18n.dart';
import 'package:notish/modules/note/presenters/user_presenter.dart';
import 'package:notish/modules/principal/presenters/note_list_presenter.dart';
import 'package:notish/widgets/notification.dart';
import 'package:provider/provider.dart';

import '../../../locator.dart';

class UserListView extends StatelessWidget {
  final userPresenter = locator<UserPresenter>();

  UserListView({Key key}) : super(key: key);
  
  searchUser(String text){
    userPresenter.searchUsers(text);
  }

  @override
  Widget build(BuildContext context) {
    userPresenter.listUsers();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UsersCollection>.value(
            value: userPresenter.usersCollection)
      ],
      child: UserListBuilder(),
    );
  }
}

class UserListBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var usersCollection = Provider.of<UsersCollection>(context);
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      padding: EdgeInsets.only(left: 8, right: 8),
      itemBuilder: (context, index) {
        var user = usersCollection.listUser[index];
        return ChangeNotifierProvider<User>.value(
            value: user,
            child: Container(
              margin: EdgeInsets.only(top: 5,bottom: 5),
              child: Row(
                children: <Widget>[
                  Container(
                      height: 40,
                      width: 40,
                      child: ClipOval(
                        child: Image(
                          image: NetworkImage(user.photoUrl),
                        ),
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(user.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                      Text(user.email)
                    ],
                  ),
                  Spacer(),
                  Chip(
                      backgroundColor: Colors.green[200],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      label: Text(S.of(context).added,
                          style: TextStyle(
                              color: Colors.green[700], fontWeight: FontWeight.w700)),
                      clipBehavior: Clip.antiAlias,
                      avatar: Icon(
                        Icons.check,
                        color: Colors.green[700],
                      )),
                ],
              ),
            ));
      },
      itemCount: usersCollection.listUser.length,
    );
  }
}


import 'package:flutter/material.dart';
import 'package:notish/generated/i18n.dart';
import 'package:notish/modules/note/views/user_list_view.dart';
import 'package:notish/utils/widgets/ctextfield_search.dart';



class ModalAddUserToNote extends StatelessWidget {
  final TextEditingController searchUserController = TextEditingController();
  final userListView = UserListView();

  searchUser() {
    searchUserController.addListener(() {
      userListView.searchUser(searchUserController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    searchUser();
    return SingleChildScrollView(
        child: Container(
          color: Color(0xFF737373),
          padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: 350,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(10.0),
                    topRight: const Radius.circular(10.0))),
            child: Column(
              children: <Widget>[
                CTextFieldSearch(
                  myController: searchUserController,
                  icon: Icons.search,
                  name: S.of(context).enter_user_name,
                  error: false,
                ),
                userListView
              ],
            ),
          ),
        ));
  }
}


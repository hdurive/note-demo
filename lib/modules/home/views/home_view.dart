import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:notish/core/models/NoteType.dart';
import 'package:notish/core/models/user_firebase.dart';
import 'package:notish/generated/i18n.dart';
import 'package:notish/locator.dart';
import 'package:notish/modules/base/BaseWidget.dart';
import 'package:notish/modules/home/presenters/home_presenter.dart';
import 'package:notish/modules/home/presenters/selected_navigation_bottom.dart';
import 'package:notish/modules/note/views/add_note_view.dart';
import 'package:notish/modules/principal/views/notes_list_view.dart';
import 'package:notish/modules/principal/views/notes_tags_view.dart';
import 'package:notish/modules/principal/views/principal_view.dart';
import 'package:notish/modules/secondView/view/second_view.dart';

import 'package:notish/shared_state/shared_memory.dart';
import 'package:notish/utils/widgets/cflatbutton.dart';
import 'package:notish/widgets/notification.dart';
import 'package:provider/provider.dart';

class HomeView extends BasePage {
  HomeView({Key key}) : super(key: key);

  static openView(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeView()),
    );
  }

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView> with BasicPage {
  final UserFirebase _userFirebase = SharedMemory.userFirebase;
  final homePresenter = locator<HomePresenter>();

  @override
  Widget body() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SelectedNavigationBottom>(
            builder: (context) => SelectedNavigationBottom(0))
      ],
      child: Scaffold(
          bottomNavigationBar: BottomNavigationBarCustom(),
          floatingActionButton: Container(
            margin: EdgeInsets.only(top: 0),
            width: 170,
            height: 40,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(50))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: FlatButton(
                    child: Icon(
                      Icons.note_add,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      AddNoteView.openView(context, NoteEnum.note);
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 2, bottom: 2),
                  width: 1,
                  color: Colors.white,
                ),
                Flexible(
                  flex: 1,
                  child: FlatButton(
                    child: Icon(
                      Icons.check_box,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      AddNoteView.openView(context, NoteEnum.list);
                    },
                  ),
                ),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          drawer: Drawer(
            child: Container(
              margin: EdgeInsets.only(top: 50, left: 10),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: new NetworkImage(
                                      _userFirebase.photoUrl)))),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(_userFirebase.name),
                      )
                    ],
                  ),
                  FlatButton(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Sign Out",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                    onPressed: () {
                      homePresenter.signOut();
                    },
                  )
                ],
              ),
            ),
          ),
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                pinned: true,
                backgroundColor: Theme.of(context).primaryColor,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    GestureDetector(
                      child:
                          Text(S.of(context).hello + " " + _userFirebase.name),
                      onTap: () {},
                    ),
                  ],
                ),
                actions: <Widget>[
                  Align(
                    alignment: Alignment.centerRight,
                    child: NotificationIcon(),
                  ),
                ],
              ),
              Consumer<SelectedNavigationBottom>(
                  builder: (context, selectedNavigationBottom, _) {
                return selectedNavigationBottom.index == 0
                    ? PrincipalView(key: PageStorageKey('Page1'))
                    : SecondView(key: PageStorageKey('Page1'));
              })
            ],
          )),
    );
  }
}

class NotificationIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {},
      child: Stack(
        children: <Widget>[
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
          PositionedCircle(
            right: 11,
            top: 11,
            width: 14,
            height: 14,
            child: WidgetRoundIcon("1"),
          )
        ],
      ),
    );
  }
}

class BottomNavigationBarCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controllerClick = Provider.of<SelectedNavigationBottom>(context);
    return BottomAppBar(
      shape: AutomaticNotchedShape(
          RoundedRectangleBorder(), StadiumBorder(side: BorderSide())),
      clipBehavior: Clip.antiAlias,
      child: Consumer<SelectedNavigationBottom>(
        builder: (context, selectedNavigationBottom, _) {
          return BottomNavigationBar(
            elevation: 0,
            currentIndex: controllerClick.index,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.speaker_notes),
                  title: Text(S.of(context).my_notes)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.supervised_user_circle),
                  title: Text(S.of(context).second_view))
            ],
            onTap: (value) {
              controllerClick.index = value;
            },
          );
        },
      ),
    );
  }
}

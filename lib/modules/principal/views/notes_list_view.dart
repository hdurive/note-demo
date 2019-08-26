import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:notish/core/models/Note.dart';
import 'package:notish/core/models/NoteType.dart';
import 'package:notish/modules/principal/presenters/note_list_presenter.dart';
import 'package:notish/widgets/notification.dart';
import 'package:provider/provider.dart';

import '../../../locator.dart';

class NotesList extends StatefulWidget {
  NotesList({Key key}) : super(key: key);

  @override
  _NotesListState createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  final noteListPresenter = locator<NoteListPresenter>();

  _NotesListState();

  @override
  void initState() {
    super.initState();
    noteListPresenter.listenAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NotesCollection>.value(
            value: noteListPresenter.notesCollectionProvider)
      ],
      child: NotesListBuilder(),
    );
  }
}


class NotesListBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var notesCollection = Provider.of<NotesCollection>(context);
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      padding: EdgeInsets.only(left: 8, right: 8),
      itemBuilder: (context, index) {
        var note = notesCollection.listNotes[index];
        return ChangeNotifierProvider<Note>.value(
            value: note, child: NoteCardView(note));
      },
      itemCount: notesCollection.listNotes.length,
    );
  }
}

class NoteCardView extends StatelessWidget {
  final Note note;

  NoteCardView(this.note);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 16,
                  width: 16,
                  decoration: BoxDecoration(
                      color: Colors.lightBlue, shape: BoxShape.circle),
                  alignment: Alignment.center,
                  child: WidgetRoundIcon("01"),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Text(
                    "Completed",
                    style: TextStyle(color: Color(0xff575757), fontSize: 10),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 40),
                  height: 16,
                  width: 16,
                  decoration: BoxDecoration(
                      color: Colors.redAccent, shape: BoxShape.circle),
                  alignment: Alignment.center,
                  child: WidgetRoundIcon("01"),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Text(
                    "Ongoing",
                    style: TextStyle(color: Color(0xff575757), fontSize: 10),
                  ),
                ),
                Spacer(),
                Align(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Icon(
                          Icons.supervisor_account,
                          color: Colors.grey[700],
                        ),
                      ),
                      Icon(
                        Icons.more_vert,
                        color: Colors.grey[700],
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "40%",
                style: TextStyle(color: Color(0xff575757), fontSize: 10),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              height: 5,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 5,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(3))),
                  ),
                  FractionallySizedBox(
                    heightFactor: 1,
                    widthFactor: 0.4,
                    child: Container(
                      height: 5,
                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.all(Radius.circular(3))),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      color: Colors.purple, shape: BoxShape.circle),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5, right: 5),
                  child: Text(this.note.title,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 20)),
                ),
                Spacer(),
                Text("18/06/17",
                    style: TextStyle(
                        color: Color(0xff575757),
                        fontWeight: FontWeight.w700,
                        fontSize: 14)),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(this.note.description,
                style: TextStyle(
                    color: Color(0xff575757),
                    fontWeight: FontWeight.w700,
                    fontSize: 14)),
          ],
        ),
      ),
    );
  }
}

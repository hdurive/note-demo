import 'package:flutter/material.dart';

class NotesTags extends StatelessWidget {
  var notesType = [
    "All Notes",
    "Market",
    "Shop",
    "Party"
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
//      physics: ClampingScrollPhysics(),
      padding: EdgeInsets.only(left: 10),
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(left: 2, right: 2),
          child: Chip(
              backgroundColor: Colors.green[200],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              label: Text(notesType[index],
                  style: TextStyle(
                      color: Colors.green[700], fontWeight: FontWeight.w700)),
              clipBehavior: Clip.antiAlias,
              avatar: Icon(
                Icons.check,
                color: Colors.green[700],
              )),
        );
      },
      itemCount: notesType.length,
    );
  }
}

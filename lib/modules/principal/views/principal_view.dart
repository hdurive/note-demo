import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:notish/generated/i18n.dart';
import 'package:notish/modules/principal/views/notes_tags_view.dart';
import 'package:notish/modules/principal/views/notes_list_view.dart';

class PrincipalView extends StatelessWidget {
  const PrincipalView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      overlapsContent: false,
        header: Container(
          color: Colors.white.withAlpha(190),
          height: 45,
          child: NotesTags(),
        ),
        sliver: SliverList(
          delegate: SliverChildListDelegate([
            Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 14),
                    child: Text(S.of(context).notes,
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                  ),
                ),
                NotesList(key: PageStorageKey('NotesList')),
              ],
            )
          ]),
        ),
      );
  }
}

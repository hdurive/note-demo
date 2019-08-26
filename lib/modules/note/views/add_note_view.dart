import 'package:dotted_border/dotted_border.dart';
import 'package:dragable_flutter_list/dragable_flutter_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:notish/core/models/NoteType.dart';
import 'package:notish/generated/i18n.dart';
import 'package:notish/locator.dart';
import 'package:notish/modules/base/BaseWidget.dart';
import 'package:notish/modules/note/model/AddElement.dart';
import 'package:notish/modules/note/presenters/note_presenter.dart';
import 'package:notish/modules/note/views/modal_add_user_note_view.dart';
import 'package:notish/modules/note/views/user_list_view.dart';
import 'package:notish/modules/principal/views/notes_tags_view.dart';
import 'package:notish/shared_state/loading.dart';
import 'package:notish/utils/widgets/ctextfield.dart';
import 'package:notish/utils/widgets/ctextfield_add_note.dart';
import 'package:notish/utils/widgets/ctextfield_add_task.dart';
import 'package:notish/utils/widgets/ctextfield_search.dart';
import 'package:notish/widgets/loading_view.dart';
import 'package:provider/provider.dart';

class AddNoteView extends BasePage {
  final NoteEnum _noteType;

  AddNoteView(this._noteType);

  static openView(BuildContext context, NoteEnum noteType) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddNoteView(noteType)),
    );
  }

  @override
  _AddNoteViewState createState() => _AddNoteViewState(this._noteType);
}

class _AddNoteViewState extends BaseState<AddNoteView> with BasicPage {
  final NoteEnum _noteType;
  final _notePresenter = locator<NotePresenter>();
  final TextEditingController _noteNameController = TextEditingController();
  final TextEditingController _noteDescriptionController =
      TextEditingController();

  _AddNoteViewState(this._noteType);

  @override
  Widget body() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CnLoading>(
          builder:(context) => CnLoading(false),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).add_note),
          actions: <Widget>[
            IconSave(this._notePresenter,this._noteNameController,this._noteDescriptionController)
          ],
        ),
        body: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return Stack(children: <Widget>[
            Container(
              height: viewportConstraints.maxHeight - 50,
              child: CustomScrollView(
                scrollDirection: Axis.vertical,
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildListDelegate([
                      Column(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                child: CTextFieldAddnote(
                                  error: false,
                                  icon: Icons.check,
                                  myController: _noteNameController,
                                  hint: S.of(context).note_title,
                                ),
                              ),
                              Container(height: 50, child: NotesTags()),
                              Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                child: Column(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        S.of(context).users,
                                        style:
                                            TextStyle(color: Colors.grey[600]),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: GestureDetector(
                                        onTap: () {
                                          showModal();
                                        },
                                        child: DottedBorder(
                                          borderType: BorderType.Circle,
                                          color: Colors.grey,
                                          radius: Radius.circular(12),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12)),
                                            child: Container(
                                              height: 30,
                                              width: 30,
                                              child: Icon(
                                                Icons.supervisor_account,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    LayoutBuilder(
                                      builder: (context, constraints) {
                                        return CTextFieldAddnote(
                                          error: false,
                                          myController:
                                          _noteDescriptionController,
                                          hint: S
                                              .of(context)
                                              .note_description,
                                          numberLines: null,
                                        );
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ]),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.redAccent,
                height: 50,
              ),
            ),
            LoadingView()
          ]);
        }),
      ),
    );
  }

  showModal() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return ModalAddUserToNote();
        });
  }
}

class IconSave extends StatelessWidget {
  final _notePresenter;
  final _noteNameController;
  final _noteDescriptionController;


  IconSave(this._notePresenter, this._noteNameController,
      this._noteDescriptionController);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.check),
        onPressed: () {
          var cnLoading=Provider.of<CnLoading>(context);
          cnLoading.setIsLoading(true);
          _notePresenter
              .addNote(
              noteName: _noteNameController.text,
              description: _noteDescriptionController.text)
              .then((value) {
            cnLoading.setIsLoading(false);
            Navigator.of(context).pop();
          });
        });
  }
}


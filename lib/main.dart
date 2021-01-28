import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_phone_state/extensions_static.dart';
import 'package:flutter_phone_state/flutter_phone_state.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:prompt_dialog/prompt_dialog.dart';
import 'package:sqflite/sqflite.dart';

import 'helper/NoteOfflineProvider.dart';
import 'helper/SqliteService.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

///
/// The example app has the ability to initiate a call from within the app; otherwise, it lists all
/// calls with their state
///
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<RawPhoneEvent> _rawEvents;
  List<PhoneCallEvent> _phoneEvents;
  List<NoteOfflineModel> listNotes = [];

  /// The result of the user typing
  String _phoneNumber;

  @override
  void initState() {
    super.initState();
    _phoneEvents = _accumulate(FlutterPhoneState.phoneCallEvents);
    _rawEvents = _accumulate(FlutterPhoneState.rawPhoneEvents);

    initData();
  }

  initData() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.phone,
    ].request();
    await SqliteService.createDatabase();
    listNotes = await SqliteService.noteOfflineProvider.getListNote() ?? [];
    setState(() {});
  }

  List<R> _accumulate<R>(Stream<R> input) {
    final items = <R>[];
    input.forEach((item) {
      if (item != null) {
        setState(() {
          items.add(item);
        });
      }
    });
    return items;
  }

  /// Extracts a list of phone calls from the accumulated events
  Iterable<PhoneCall> get _completedCalls => Map.fromEntries(_phoneEvents.reversed.map((PhoneCallEvent event) {
        return MapEntry(event.call.id, event.call);
      })).values.where((c) => c.isComplete).toList();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Phone Call State Example App'),
        ),
        body: ListView(
          padding: EdgeInsets.all(10),
          children: [
            verticalSpace,
            _title("Current Calls"),
            for (final call in FlutterPhoneState.activeCalls) _CallCard(phoneCall: call),
            if (FlutterPhoneState.activeCalls.isEmpty) Center(child: Text("No Active Calls")),
            _title("List Note"),
            ListView.builder(
              itemCount: listNotes.length,
              shrinkWrap: true,
              itemBuilder: (context, position) {
                var item = listNotes[position];
                return Row(
                  children: [
                    Text(item.article),
                    Spacer(),
                    Text(item.content),
                  ],
                );
              },
            ),
            if (listNotes.isEmpty) Center(child: Text("No Completed Calls")),
            verticalSpace,
            _title("Raw Event History"),
            if (_rawEvents.isNotEmpty)
              Padding(
                padding: EdgeInsets.all(10),
                child: Table(
                  children: [
                    TableRow(children: [
                      Text(
                        "id",
                        style: listHeaderStyle,
                        maxLines: 1,
                      ),
                      Text("number", style: listHeaderStyle),
                      Text("event", style: listHeaderStyle),
                    ]),
                    for (final event in _rawEvents)
                      TableRow(children: [
                        _cell(truncate(event.id, 8)),
                        _cell(event.phoneNumber),
                        _cell(value(event.type)),
                      ]),
                  ],
                ),
              ),
            if (_rawEvents.isEmpty) Center(child: Text("No Raw Events")),
          ],
        ),
      ),
    );
  }

  Widget _cell(text) {
    return Padding(
        padding: EdgeInsets.all(5),
        child: Text(
          text?.toString() ?? '-',
          maxLines: 1,
        ));
  }

  Widget _title(text) {
    return Padding(
        padding: EdgeInsets.only(bottom: 10, top: 5),
        child: Text(text?.toString() ?? '-', maxLines: 1, style: headerStyle));
  }

  _initiateCall() {
    if (_phoneNumber?.isNotEmpty == true) {
      setState(() {
        FlutterPhoneState.startPhoneCall(_phoneNumber);
      });
    }
  }

  Widget _CallCard({phoneCall}) {
    return Card(
      child: ListTile(
          dense: true,
          leading: Icon(phoneCall.isOutbound ? Icons.arrow_upward : Icons.arrow_downward),
          title: Text(
            "+${phoneCall.phoneNumber ?? "Unknown number"}: ${value(phoneCall.status)}",
            overflow: TextOverflow.visible,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (phoneCall.id?.isNotEmpty == true) Text("id: ${truncate(phoneCall.id, 12)}"),
              for (final event in phoneCall.events)
                Text(
                  "- ${value(event.status) ?? "-"}",
                  maxLines: 1,
                ),
            ],
          ),
          trailing: FutureBuilder<PhoneCall>(
            builder: (context, snap) {
              if (snap.hasData && snap.data?.isComplete == true) {
                return Text("${phoneCall.duration?.inSeconds ?? '?'}s");
              } else {
                return InkWell(
                  onTap: () {
                    saveToDB(phoneCall);
                  },
                  child: Container(
                    child: Text('Save'),
                  ),
                );
              }
            },
            future: Future.value(phoneCall.done),
          )),
    );
  }

  void saveToDB(phoneCall) async {
    var noteCurrent = await SqliteService.noteOfflineProvider.getNoteWithArticle(phoneCall.phoneNumber);
    var note = await prompt(
      context,
      title: Text('Note Phone: ' + phoneCall.phoneNumber),
      textOK: Text('Agree'),
      textCancel: Text('Cancel'),
      hintText: 'Input note for phone',
      autoFocus: true,
      initialValue: noteCurrent != null ? noteCurrent.content : '',
      obscureText: false,
      obscuringCharacter: '•',
      textCapitalization: TextCapitalization.words,
    );
    if (note == null || note.isEmpty) return;
   await SqliteService.noteOfflineProvider.saveNoteInArticle(note, phoneCall.phoneNumber);
    listNotes = await SqliteService.noteOfflineProvider.getListNote();
    setState(() {

    });
  }
}

const headerStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
const listHeaderStyle = TextStyle(fontWeight: FontWeight.bold);
const verticalSpace = SizedBox(height: 50);

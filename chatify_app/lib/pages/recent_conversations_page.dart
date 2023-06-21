import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';

import '../services/db_service.dart';
import '../services/navigation_service.dart';

import '../models/conversation.dart';
import '../models/message.dart';

import '../pages/conversation_page.dart';

class RecentConversationsPage extends StatelessWidget {
  final double _height;
  final double _width;

  RecentConversationsPage(this._height, this._width);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      width: _width,
      child: ChangeNotifierProvider<AuthProvider>.value(
        value: AuthProvider.instance,
        child: _conversationsListViewWidget(),
      ),
    );
  }

  Widget _conversationsListViewWidget() {
    return Builder(
      builder: (BuildContext _context) {
        var _auth = Provider.of<AuthProvider>(_context);
        return Container(
          height: _height,
          width: _width,
          child: StreamBuilder<List<ConversationSnippet>>(
            stream: DBService.instance.getUserConversations(_auth.user.uid),
            builder: (_context, _snashot) {
              var _data = _snashot.data;
              if (_data != null) {
                _data.removeWhere((_c) {
                  return _c.timestamp == null;
                });
                return _data.length != 0
                    ? ListView.builder(
                        itemCount: _data.length,
                        itemBuilder: (_context, _index) {
                          return ListTile(
                            onTap: () {
                              NavigationService.instance.navigateToRoute(
                                MaterialPageRoute(
                                  builder: (BuildContext _context) {
                                    return ConversationPage(
                                        _data[_index].conversationID,
                                        _data[_index].id,
                                        _data[_index].name,
                                        _data[_index].image);
                                  },
                                ),
                              );
                            },
                            title: Text(_data[_index].name),
                            subtitle: Text(
                                _data[_index].type == MessageType.Text
                                    ? _data[_index].lastMessage
                                    : "Attachment: Image"),
                            leading: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(_data[_index].image),
                                ),
                              ),
                            ),
                            trailing: _listTileTrailingWidgets(
                                _data[_index].timestamp),
                          );
                        },
                      )
                    : Align(
                        child: Text(
                          "No Conversations Yet!",
                          style:
                              TextStyle(color: Colors.white30, fontSize: 15.0),
                        ),
                      );
              } else {
                return SpinKitWanderingCubes(
                  color: Colors.blue,
                  size: 50.0,
                );
              }
            },
          ),
        );
      },
    );
  }

  Widget _listTileTrailingWidgets(Timestamp _lastMessageTimestamp) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text(
          "Last Message",
          style: TextStyle(fontSize: 15),
        ),
        Text(
          timeago.format(_lastMessageTimestamp.toDate()),
          style: TextStyle(fontSize: 15),
        ),
      ],
    );
  }
}

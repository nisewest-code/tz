import 'package:flutter/material.dart';
import 'package:tz/pages/list_domains_page.dart';

class SearchPage extends StatelessWidget {

  TextEditingController _textEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search Domain")),
      body: Container(
          padding: EdgeInsets.all(8),
          child: Center(
            child: Row(
              children: [
                Expanded(child: TextField(controller: _textEditingController,)),
                IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      if (_textEditingController.text.isNotEmpty) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ListDomainsPage(
                                        _textEditingController.text)));
                      }
                    })
              ],
            ),
          )
      ),
    );
  }

}


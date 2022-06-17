import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tz/data.dart';

class InfoDomainPage extends StatefulWidget {
  Domain domain;

  InfoDomainPage(this.domain);

  @override
  State<StatefulWidget> createState() => _InfoDomainPage();

}

class _InfoDomainPage extends State<InfoDomainPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text("Domain Info")),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          _buildTextWidget("NS", widget.domain.NS),
          _buildTextWidget("A", widget.domain.A),
          _buildTextWidget("CNAME", widget.domain.CNAME),
          _buildTextWidget("TXT", widget.domain.TXT),
          _buildMxWidget("MX", widget.domain.MX),
        ],
      )
    );
  }

  Widget _buildTextWidget(String name, List<String>? list) {
    return Card(
        elevation: 4,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              (list != null) ? Column(
                children: [
                  for (var i = 0; i< list.length; i++) Text(list[i])
                ],
              ) : Text("None")
            ]
        )
    );
  }

  Widget _buildMxWidget(String name, List<Mx>? list){
    return Card(
        elevation: 4,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              (list != null) ? Column(
                children: [
                  for (var i = 0; i< list.length; i++) Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(list[i].exchange),
                      Text("priority: "+ list[i].priority.toString()),
                  ],)
                ],
              ) : Text("None")
            ]
        )
    );
  }

}
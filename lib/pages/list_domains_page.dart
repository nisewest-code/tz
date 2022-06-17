import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tz/data.dart';
import 'package:tz/pages/info_domain_page.dart';
import 'package:tz/utils/api_client.dart';

class ListDomainsPage extends StatefulWidget {

  ListDomainsPage(this.request);

  String request;

  @override
  State<StatefulWidget> createState() => _ListDomainsPage();
}

class _ListDomainsPage extends State<ListDomainsPage> {

  @override
  void initState(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text("List Domains")),
      body: _buildBody(context),
    );
  }

  FutureBuilder<ResponseData> _buildBody(BuildContext context) {
    final client = ApiClient(Dio(BaseOptions(contentType: "application/json")));
    return FutureBuilder<ResponseData>(
      future: client.searchDomain(widget.request),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final ResponseData? posts = snapshot.data;

            return _buildListView(context, posts!);
          } else {
            return Center( child: Text("Domains not found"));
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  ListView _buildListView(BuildContext context, ResponseData responseData) {
    List<Domain> domains = responseData.domains!;
    return ListView.builder(
      itemCount: domains.length,
      padding: EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return GestureDetector(
            child: Card(
              elevation: 4,
              child: ListTile(
                title: Text(
                  domains[index].domain,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              )
          ),
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => InfoDomainPage(
                        domains[index])));
          }
        );
      },
    );
  }

}
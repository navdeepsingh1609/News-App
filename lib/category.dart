import 'dart:convert';

import 'package:news_app/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Category extends StatefulWidget {
  String Query;
  Category({required this.Query});
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<NewsQueryModel> newsModelList = <NewsQueryModel>[];
  bool isLoading = true;
  getNewsByQuery(String query) async {
    String url = "";
    if (query == "Trending" || query == "India") {
      url =
          "https://newsapi.org/v2/top-headlines?country=in&language=en&apiKey=aff481ff9594444fba02e5a8b9c54e53";
    } else if (query == "World") {
      url =
          "https://newsapi.org/v2/top-headlines?language=en&apiKey=aff481ff9594444fba02e5a8b9c54e53";
    } else if (query == "Technology") {
      url =
          "https://newsapi.org/v2/top-headlines?sources=techcrunch&language=en&apiKey=aff481ff9594444fba02e5a8b9c54e53";
    } else {
      DateTime now = new DateTime.now();
      url =
          "https://newsapi.org/v2/everything?q=$query&from=${now.year}-${now.month}-${now.day}&language=en&sortBy=publishedAt&apiKey=aff481ff9594444fba02e5a8b9c54e53";
    }

    Response response = await get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    setState(() {
      data["articles"].forEach((element) {
        NewsQueryModel newsQueryModel = new NewsQueryModel();
        newsQueryModel = NewsQueryModel.fromMap(element);
        newsModelList.add(newsQueryModel);
        setState(() {
          isLoading = false;
        });
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNewsByQuery(widget.Query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.Query}"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(15, 25, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.indigo),
                      child: Center(
                        child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: 125,
                              child: Text(
                                " Here, we go !",
                                maxLines: 1,
                                overflow: TextOverflow.visible,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                          // Expanded(
                          //   child: Align(
                          //     alignment: AlignmentDirectional.centerStart,
                          //     child: Text(
                          //       " Here, we go results for ${widget.Query}: ",
                          //       softWrap: false,
                          //       overflow: TextOverflow.fade,
                          //       style:
                          //           TextStyle(fontSize: 18, color: Colors.white),
                          //     ),
                          //   ),
                          // ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              isLoading
                  ? Container(
                      height: MediaQuery.of(context).size.height - 500,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: newsModelList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              elevation: 1.0,
                              child: Stack(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        newsModelList[index].newsImg,
                                        fit: BoxFit.fitHeight,
                                        height: 230,
                                        width: double.infinity,
                                      )),
                                  Positioned(
                                      left: 0,
                                      right: 0,
                                      bottom: 0,
                                      child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              gradient: LinearGradient(
                                                  colors: [
                                                    Colors.black12
                                                        .withOpacity(0),
                                                    Colors.black
                                                  ],
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter)),
                                          padding: EdgeInsets.fromLTRB(
                                              15, 15, 10, 8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                newsModelList[index].newsHead,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                newsModelList[index]
                                                            .newsDes
                                                            .length >
                                                        50
                                                    ? "${newsModelList[index].newsDes.substring(0, 55)}...."
                                                    : newsModelList[index]
                                                        .newsDes,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12),
                                              )
                                            ],
                                          )))
                                ],
                              )),
                        );
                      }),
            ],
          ),
        ),
      ),
    );
  }
}

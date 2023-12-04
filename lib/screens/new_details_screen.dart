import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsScreen extends StatelessWidget {
  final Article newsDetails;

  NewsDetailsScreen({Key? key, required this.newsDetails}) : super(key: key);

  Future<void> _launchUrl() async {
    final Uri _url = Uri.parse(newsDetails.url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 316,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                newsDetails.urlToImage ??
                    'https://upload.wikimedia.org/wikipedia/commons/b/b7/TechCrunch_favicon_gradient.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: MediaQuery.of(context).size.width * 9,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Color(0xFFFCFCFC),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Text(
                    newsDetails.title ?? '',
                    style: TextStyle(
                      color: Color(0xff231F20),
                      fontWeight: FontWeight.w600,
                      fontSize: 32,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  InkWell(
                    onTap: _launchUrl,
                    child: Row(
                      children: [
                        CircleAvatar(
                            radius: 15,
                            child: Image.network(
                              newsDetails.urlToImage ??
                                  'https://upload.wikimedia.org/wikipedia/commons/b/b7/TechCrunch_favicon_gradient.png',
                              fit: BoxFit.fill,
                            )),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          newsDetails.author ?? 'Anonymous Author',
                          style: TextStyle(
                            color: Color(0xff6D6265),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          newsDetails.publishedAt.toString(),
                          style: TextStyle(
                            color: Color(0xff6D6265),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    newsDetails.description ?? '',
                    style: TextStyle(
                      color: Color(0xff231F20),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

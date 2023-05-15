import 'package:chaleno/chaleno.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final chaleno = Chaleno();

  String url = "https://g1.globo.com";
  List<Result> title = [];
  List<Result> image = [];
  List<Result> group = [];
  List<Result> time = [];
  List<Result> location = [];

  Future<void> scrapData() async {
    final response = await Chaleno().load(url);
    image = response?.getElementsByClassName('bstn-fd-picture-image') ?? [];
    title = response?.getElementsByClassName(
            'feed-post-link gui-color-primary gui-color-hover') ??
        [];
    time = response?.getElementsByClassName("feed-post-datetime") ?? [];
    location =
        response?.getElementsByClassName("feed-post-metadata-section") ?? [];
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    scrapData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scrapping Page'),
      ),
      body: Visibility(
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        visible: image.isNotEmpty,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: image.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () async {
                await launchUrl(
                  Uri.parse(title[index].href ?? ""),
                  mode: LaunchMode.externalApplication,
                );
              },
              child: Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          image[index].src ?? "",
                        ),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400,
                          blurRadius: 6,
                          spreadRadius: 1,
                          offset: const Offset(7, 9),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: const EdgeInsets.all(15),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.40,
                        child: Text(
                          title[index].text!,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(196, 23, 12, 1),
                          ),
                          softWrap: true,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: [
                            Text("${time[index].text!} -"),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.20,
                              child: Text(
                                location[index].text!,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

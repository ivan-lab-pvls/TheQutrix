import 'package:cached_network_image/cached_network_image.dart';
import 'package:financial_app/model/news_item.dart';
import 'package:financial_app/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';

class FullNewsPage extends StatefulWidget {
  const FullNewsPage({
    super.key,
    required this.callBack,
    required this.news,
  });
  final Function callBack;
  final NewsItem news;

  @override
  State<FullNewsPage> createState() => _FullNewsPageState();
}

class _FullNewsPageState extends State<FullNewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 65, 18, 44),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Row(
                children: [
                  Icon(
                    Icons.chevron_left,
                  ),
                  Text(
                    'Back',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 11),
                        child: Container(
                          height: 178,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: CachedNetworkImageProvider(
                                      widget.news.image!))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 11),
                        child: Row(
                          children: [
                            Image.asset('assets/Avatar.png'),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              widget.news.author!,
                              style: const TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          widget.news.title!,
                          style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Text(
                        widget.news.text!,
                        style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ]),
                  ],
                ),
              ),
            ),
          ),
          BottomBar(callBack: () {
            Navigator.pop(context);
            widget.callBack();
          }),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fooder/circle_image.dart';
import 'package:fooder/fooder_theme.dart';

class AuthorCard extends StatefulWidget {
  const AuthorCard(
      {Key? key,
      required this.authorName,
      required this.title,
      this.imageProvider})
      : super(key: key);

  final String authorName;
  final String title;
  final ImageProvider? imageProvider;

  @override
  State<AuthorCard> createState() => _AuthorCardState();
}

class _AuthorCardState extends State<AuthorCard> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleImage(
                imageProvider: widget.imageProvider,
                imageRadius: 28.0,
              ),
              const SizedBox(
                width: 8.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.authorName,
                    style: FooderTheme.lightTextTheme.headline2,
                  ),
                  Text(
                    widget.title,
                    style: FooderTheme.lightTextTheme.headline3,
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            icon: Icon(_isFavorite ? Icons.favorite : Icons.favorite_border),
            iconSize: 30,
            color: Colors.red[400],
            onPressed: () {
              setState(() {
                _isFavorite = !_isFavorite;
              });
            },
          ),
        ],
      ),
    );
  }
}

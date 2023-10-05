import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FullImageScreen extends StatelessWidget {
  final String url;
  const FullImageScreen({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: url,
      child: Container(
        decoration: BoxDecoration(color: Colors.transparent),
        child: CachedNetworkImage(imageUrl:url,fit: BoxFit.contain,),
      ),
    );
  }
}

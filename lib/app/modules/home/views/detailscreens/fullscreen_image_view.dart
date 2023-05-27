import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class FullScreenImagePage extends StatefulWidget {
  final String imageUrl;
  FullScreenImagePage({required this.imageUrl});
  @override
  _FullScreenImagePageState createState() => _FullScreenImagePageState();
}

class _FullScreenImagePageState extends State<FullScreenImagePage> {
  late PhotoViewController _controller;
  @override
  void initState() {
    super.initState();
    _controller = PhotoViewController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PhotoView(
          imageProvider: NetworkImage(widget.imageUrl),
          loadingBuilder: (context, event) => Center(
            child: CircularProgressIndicator(),
          ),
          controller: _controller,
        ),
      ),
    );
  }
}

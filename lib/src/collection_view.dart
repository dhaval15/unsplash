import 'package:flutter/material.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';

import 'api.dart';
import 'photo_tile.dart';

class CollectionView extends StatefulWidget {
  final String collectionId;

  const CollectionView({Key key, this.collectionId})
      : assert(collectionId != null, 'collectionId should not be null'),
        super(key: key);

  @override
  _CollectionViewState createState() => _CollectionViewState();
}

class _CollectionViewState extends State<CollectionView>
    with AutomaticKeepAliveClientMixin<CollectionView> {
  PagewiseLoadController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PagewiseLoadController(
      pageSize: 20,
      pageFuture: (page) => UnSplashApi.getPhotos(
          UnSplashRequest(collection: widget.collectionId, page: page + 1)),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return PagewiseGridView.count(
      pageLoadController: _controller,
      addAutomaticKeepAlives: true,
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      itemBuilder: (context, entry, index) => PhotoTile(
        photo: entry,
      ),
      showRetry: false,
      errorBuilder: (context, error) => Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              error,
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(width: 8),
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                _controller.retry();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

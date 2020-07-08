import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unsplash/src/collection_view.dart';

import 'cupertino_sliding_segmented_tabbar.dart';
import 'models.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin<HomeScreen> {
  TabController _controller;
  final collections = [
    Collection(id: '1580860', title: 'One Item'),
    Collection(id: '139386', title: 'Cats'),
  ];

  @override
  void initState() {
    super.initState();
    _controller = TabController(initialIndex: 0, length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: CupertinoSlidingSegmentedTabBar(
            labelPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            controller: _controller,
            selectedLabelColor: Colors.black87,
            unselectedLabelColor: Colors.black45,
            labels: collections.map((collection) => collection.title).toList(),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: TabBarView(
            controller: _controller,
            children: <Widget>[
              CollectionView(
                collectionId: collections[0].id,
              ),
              CollectionView(
                collectionId: collections[1].id,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


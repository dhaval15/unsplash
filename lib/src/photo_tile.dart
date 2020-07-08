import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'utils.dart';

import 'models.dart';

class PhotoTile extends StatelessWidget {
  final Photo photo;

  const PhotoTile({
    Key key,
    @required this.photo,
  })  : assert(photo != null, 'photo should not be null'),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: photo.urls['small'],
                placeholder: (context, _) => Container(
                  color: photo.color.toColor(),
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              photo.description ?? photo.altDescription ?? 'No Description',
              textAlign: TextAlign.start,
              maxLines: 1,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(color: Colors.black.withAlpha(150)),
            ),
          ),
        ],
      ),
    );
  }
}

// Copyright (c) 2021 The Khalti Authors. All rights reserved.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide required;
import 'package:khalti_flutter/src/widget/image.dart';

/// The widget which shows bank's logo and name.
class KhaltiBankTile extends StatelessWidget {
  /// Creates [KhaltiBankTile] with the provided values.
  const KhaltiBankTile({
    Key key,
    @required this.logoUrl,
    @required this.name,
    @required this.onTap,
  }) : super(key: key);

  /// The bank's logo url.
  final String logoUrl;

  /// The bank's name.
  final String name;

  /// Called when the user taps this tile.
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        height: 32,
        width: 32,
        child: KhaltiImage.network(url: logoUrl),
      ),
      // minLeadingWidth: 0,
      title: Text(
        name,
        style: Theme.of(context).textTheme.bodyText2,
      ),
      onTap: onTap,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:move_app/common/constants/size_constants.dart';
import 'package:move_app/common/extensions/size_extensions.dart';
import 'package:move_app/presentation/widgets/logo.dart';

import 'navigation_expanded_list_item.dart';
import 'navigation_list_item.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Theme.of(context).primaryColor.withOpacity(0.7),
          blurRadius: 4,
        )
      ]),
      width: Sizes.dimen_300.w.toDouble(),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: Sizes.dimen_8.h.toDouble(),
                bottom: Sizes.dimen_18.h.toDouble(),
                left: Sizes.dimen_8.w.toDouble(),
                right: Sizes.dimen_8.w.toDouble(),
              ),
              child: Logo(
                height: Sizes.dimen_20.h.toDouble(),
              ),
            ),
            NavigationListItem(
              title: 'Favorite Movies',
              onPressed: () {},
            ),
            NavigationExpandedListItem(
              title: 'Language',
              onPressed: () {},
              children: [
                "English",
                "Viet Nam"
              ],
            ),
            NavigationListItem(
              title: 'Feedback',
              onPressed: () {},
            ),
            NavigationListItem(
              title: 'About',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

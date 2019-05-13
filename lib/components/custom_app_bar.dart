import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  TabController tabController;

  CustomAppBar({this.tabController});

@override
  Widget build(BuildContext context) {
    return Material(
      elevation: 7.0,
      color: Colors.white,
      child: TabBar(
        controller: tabController,
        unselectedLabelColor: Colors.black,
        tabs: <Widget>[
          Tab(
            icon: Icon(
              Icons.add,
              color: Colors.grey.shade700,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.list,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}
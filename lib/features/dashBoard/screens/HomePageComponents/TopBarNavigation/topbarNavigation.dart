import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardTopBarNavigation extends StatelessWidget {
  final TabController _topTabController;

  const DashboardTopBarNavigation(
      {super.key, required TabController controller})
      : _topTabController = controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black12,
      child: TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorWeight: 2,
        // indicatorColor: Colors.green,
        // indicator: BoxDecoration(borderRadius: ),
        controller: _topTabController,
        tabs: const [
          Tab(
            text: 'Burger',
          ),
          Tab(
            text: 'Pizza',
          ),
          Tab(
            text: 'Biryani',
          )
        ],
      ),
    );
  }
}

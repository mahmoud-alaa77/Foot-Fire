import 'package:flutter/material.dart';
import 'package:foot_fire/features/table/ui/widgets/table_list_view.dart';
import 'package:foot_fire/features/table/ui/widgets/top_table_standing.dart';

class TableScreenBody extends StatelessWidget {
  const TableScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsetsDirectional.symmetric(vertical: 12),
      child: Column(
        children: [
          TopTableStanding(),
          TableListView(),
        ],
      ),
    );
  }
}

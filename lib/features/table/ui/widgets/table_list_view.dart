import 'package:flutter/material.dart';
import 'package:foot_fire/features/table/ui/widgets/table_list_item.dart';

class TableListView extends StatelessWidget {
  const TableListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return const TableListItem(
              rank: "1",
              teamName: "Arsnal",
              logoTeamImage:
                  "https://www.thesportsdb.com/images/media/team/badge/uvxuqq1448813372.png/tiny",
              play: "1",
              win: "1",
              lose: "1",
              drawUp: "2",
              goalsFor: "2",
              goalsAgainst: "6",
              goalDifference: "5",
              points: "5");
        },
        itemCount: 16,
      ),
    );
  }
}

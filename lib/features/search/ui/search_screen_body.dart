import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foot_fire/core/helpers/spaces.dart';
import 'package:foot_fire/features/search/logic/cubit/search_cubit.dart';
import 'package:foot_fire/features/search/ui/widgets/custom_search_text_field.dart';
import 'package:foot_fire/features/search/ui/widgets/filter_list.dart';
import 'package:foot_fire/features/search/ui/widgets/search_bloc_builder.dart';

class SearchScreenBody extends StatelessWidget {
  const SearchScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CustomSearchWidget(
            onChanged: (val) async {
              await context.read<SearchCubit>().search(val);
            },
          ),
          verticalSpace(10),
          const FilterList(),
          verticalSpace(12),
          const SearchBlocBuilder(),
        ],
      ),
    );
  }
}

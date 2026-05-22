import 'package:auto_route/auto_route.dart';
import 'package:clean_app/presentation/bloc/search/search_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const SearchResultAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final String searchText = context.select<SearchBloc, String>(
      (SearchBloc searchBloc) => searchBloc.state.searchText,
    );

    return AppBar(
      leading: GestureDetector(
        onTap: () {
          context.router.maybePop();
        },
        child: const Icon(Icons.arrow_back),
      ),
      title: Text(
        'searchedResult'.tr(args: <String>[searchText]),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

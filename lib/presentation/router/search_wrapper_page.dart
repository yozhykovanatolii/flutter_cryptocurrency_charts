import 'package:auto_route/auto_route.dart';
import 'package:clean_app/backbone/dependency_injection.dart' as di;
import 'package:clean_app/presentation/bloc/search/search_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SearchWrapperPage extends StatelessWidget {
  const SearchWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchBloc>(
      create: (_) => di.sl.get<SearchBloc>(),
      child: const AutoRouter(),
    );
  }
}

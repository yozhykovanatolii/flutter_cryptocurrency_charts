import 'package:clean_app/presentation/bloc/search/search_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

extension SearchErrorExtension on SearchErrorType? {
  String mapSearchErrorTypeToMessage() {
    final SearchErrorType? searchErrorType = this;
    if (searchErrorType == null) {
      return '';
    }
    switch (searchErrorType) {
      case SearchErrorType.noInternetConnection:
        return 'no_internet_connection'.tr();
      case SearchErrorType.badRequest:
        return 'badRequest'.tr();
      case SearchErrorType.parsing:
        return 'invalidResponseFormat'.tr();
      case SearchErrorType.unknown:
        return 'unknownError'.tr();
    }
  }
}

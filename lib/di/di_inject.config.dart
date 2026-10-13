// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../api/api_manager.dart' as _i1047;
import '../data/repository/news/data_sources/remote/impl/news_remote_data_source_impl.dart'
    as _i852;
import '../data/repository/news/data_sources/remote/news_remote_data_source.dart'
    as _i833;
import '../data/repository/news/repository/impl/news_repository_impl.dart'
    as _i1060;
import '../data/repository/news/repository/news_repository_contract.dart'
    as _i37;
import '../data/repository/sources/data_source/remote/impl/source_remote_data_source_impl.dart'
    as _i371;
import '../data/repository/sources/data_source/remote/source_remote_data_source.dart'
    as _i854;
import '../data/repository/sources/repository/imp/source_repository_impl.dart'
    as _i39;
import '../data/repository/sources/repository/source_repository_contract.dart'
    as _i247;
import '../ui/home/category_details/news/cubit/cubit_news_view_model.dart'
    as _i789;
import '../ui/home/category_details/sources/cubit/cubit_source_view_model.dart'
    as _i190;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i1047.ApiManager>(() => _i1047.ApiManager());
    gh.factory<_i833.NewsRemoteDataSource>(
      () => _i852.NewsRemoteDataSourceImpl(apiManager: gh<_i1047.ApiManager>()),
    );
    gh.factory<_i854.SourceRemoteDataSource>(
      () =>
          _i371.SourceRemoteDataSourceImpl(apiManager: gh<_i1047.ApiManager>()),
    );
    gh.factory<_i37.NewsRepositoryContract>(
      () => _i1060.NewsRepositoryImpl(gh<_i833.NewsRemoteDataSource>()),
    );
    gh.factory<_i247.SourceRepositoryContract>(
      () => _i39.SourceRepositoryImpl(
        sourceRemoteDataSource: gh<_i854.SourceRemoteDataSource>(),
      ),
    );
    gh.factory<_i789.CubitNewsViewModel>(
      () => _i789.CubitNewsViewModel(
        newsRepositoryContract: gh<_i37.NewsRepositoryContract>(),
      ),
    );
    gh.factory<_i190.CubitSourceViewModel>(
      () => _i190.CubitSourceViewModel(
        sourceRepositoryContract: gh<_i247.SourceRepositoryContract>(),
      ),
    );
    return this;
  }
}

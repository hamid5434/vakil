
import 'package:vakil_0098/data/service/service.dart';
import 'package:vakil_0098/data/source/home/baner_data_source.dart';
import 'package:vakil_0098/models/home/baner.dart';

final bannerRepository =
    BanerRepository(dataSource: BannerRemoteDataSource(service: Service()));

abstract class IBanerRepositoy {
  Future<List<BannerEntity>> getAll();
}

class BanerRepository implements IBanerRepositoy {
  final IBanerDataSource dataSource;

  BanerRepository({required this.dataSource});

  @override
  Future<List<BannerEntity>> getAll() async {
    final products = dataSource.getAll();
    return products;
  }
}

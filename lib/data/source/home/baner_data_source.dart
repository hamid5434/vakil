

import 'package:vakil_0098/common/app_urls.dart';
import 'package:vakil_0098/common/exceptions.dart';
import 'package:vakil_0098/data/service/service.dart';
import 'package:vakil_0098/models/home/baner.dart';

abstract class IBanerDataSource {
  Future<List<BannerEntity>> getAll();
}

class BannerRemoteDataSource
    implements IBanerDataSource {
  final IService service;

  BannerRemoteDataSource({required this.service});

  @override
  Future<List<BannerEntity>> getAll() async {
    try {
      var body = {
        "inputLoadObjectAsync": {
          "connection": {
            "dataBase": "OKStoreService",
            "server": "reportdb2017"
          },
          "isProcedure": true,
          "objectName": "spZ_getSlider",
          "params": []
        }
      };
      var response = await service.postWithOutToken(url: AppUrls.banner!,body: body);

      List<BannerEntity> banners = BannerEntitys.fromJson(response['dataObject']).list;
      return banners;
    } catch (e) {
      throw AppException();
    }
  }
}

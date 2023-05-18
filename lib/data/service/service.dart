import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:vakil_0098/common/common.dart';
import 'package:vakil_0098/common/exceptions.dart';
import 'package:vakil_0098/common/token.dart';
import 'package:vakil_0098/data/service/response_validator.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

abstract class IService {
  Future<dynamic> post({required String url, var body});

  Future<dynamic> postWithFile(
      {required String url, var body, required List<AssetEntity> filePaths});

  Future<dynamic> postStatusCode({required String url, var body});

  Future<dynamic> postWithOutToken({required String url, var body});

  Future<dynamic> get({required String url});

  Future<dynamic> put({required String url, var body});

  Future<dynamic> delete({required String url, var body});
}

class Service with ResponseValidator implements IService {
  @override
  Future delete({required String url, body}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future get({required String url}) async {
    try {
      var token = await Token.getToken();
      print(token);
      var headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      };

      if (token == null) {
        headers = {'Content-Type': 'application/json'};
      }

      var request = http.Request('GET', Uri.parse(url));

      print(url);

      if (url.contains('sap.okcs.com')) {
        request.headers.addAll(headers);
      }

      http.StreamedResponse response = await request.send();

      var result = await validateResponse(response);

      if (result is AppException) {
        if(result.statusCode == 401){
          showDialog();
        }
        throw result;
      } else {
        return result;
      }
    } catch (e) {
      throw e;
    }
  }

  @override
  Future post({required String url, body}) async {
    try {
      var token = await Token.getToken();
      print(token);
      var headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      };

      if (token == null) {
        headers = {'Content-Type': 'application/json'};
      }

      var request = http.Request('POST', Uri.parse(url));
      String bodyStr = json.encode(body);
      String bodyStrFatoEn = Common.StrConvertNumE2P(bodyStr);

      print(url);
      print(bodyStrFatoEn);

      request.body = bodyStrFatoEn;
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      var result = await validateResponse(response);
      if (result is AppException) {
        if(result.statusCode == 401){
          showDialog();
        }
        throw result;
      } else {
        return result;
      }
    } catch (e) {
      throw e;
    }
  }

  @override
  Future postWithOutToken({required String url, body}) async {
    try {
      var headers = {'Content-Type': 'application/json'};

      var request = http.Request('POST', Uri.parse(url));
      String bodyStr = json.encode(body);
      String bodyStrFatoEn = Common.StrConvertNumE2P(bodyStr);

      print(url);
      print(bodyStrFatoEn);

      request.body = bodyStrFatoEn;
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      var result = await validateResponse(response);

      if (result is AppException) {
        if(result.statusCode == 401){
          showDialog();
        }
        throw result;
      } else {
        return result;
      }
    } catch (e) {
      throw e;
    }
  }

  @override
  Future put({required String url, body}) async{
    try {
      var token = await Token.getToken();
      print(token);
      var headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      };

      if (token == null) {
        headers = {'Content-Type': 'application/json'};
      }

      var request = http.Request('PUT', Uri.parse(url));
      String bodyStr = json.encode(body);
      String bodyStrFatoEn = Common.StrConvertNumE2P(bodyStr);

      print(url);
      print(bodyStrFatoEn);

      request.body = bodyStrFatoEn;
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      var result = await validateResponse(response);

      if (result is AppException) {
        throw result;
      } else {
        return result;
      }
    } catch (e) {
      throw e;
    }
  }

  @override
  Future postStatusCode({required String url, body}) async {
    try {
      var token = await Token.getToken();
      print(token);
      var headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      };

      if (token == null) {
        headers = {'Content-Type': 'application/json'};
      }

      var request = http.Request('POST', Uri.parse(url));
      String bodyStr = json.encode(body);
      String bodyStrFatoEn = Common.StrConvertNumE2P(bodyStr);

      print(url);
      print(bodyStrFatoEn);

      request.body = bodyStrFatoEn;
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      var result = await validateResponseByStatusCode(response);

      if (result is AppException) {
        if(result.statusCode == 401){
          showDialog();
        }
        throw result;
      } else {
        return result;
      }
    } catch (e) {
      throw e;
    }
  }

  @override
  Future postWithFile(
      {required String url, body, required List<AssetEntity> filePaths}) async {
    var token = await Token.getToken();

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.fields.addAll(body);

      print(body);
      print(url);

      print(token);
      var headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      };

      if (token == null) {
        headers = {'Content-Type': 'application/json'};
      }
      request.headers.addAll(headers);

      for (int i = 0; i < filePaths.length; i++) {
        File? file = await filePaths[i].file;
        List<int> imageData = file!.readAsBytesSync();
        request.files.add(
          http.MultipartFile.fromBytes(
            'Images',
            imageData,
            filename: filePaths[i].title,
          ),
        );
      }

      var response = await request.send();

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        print(await response.stream.bytesToString());
        return true;
      }
      else if(response.statusCode >= 401 ){
        showDialog();
        print('${response.reasonPhrase!} ${response.statusCode}');
        throw '${response.reasonPhrase!} ${response.statusCode}';
      }
      else {
        print('${response.reasonPhrase!} ${response.statusCode}');
        throw '${response.reasonPhrase!} ${response.statusCode}';
      }
    } catch (e) {
      throw (e);
    }
  }

  showDialog(){
    //Common.singInDilog();
  }

}

import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bmfbase/BaiduMap/bmfmap_base.dart'
    show BMFMapSDK, BMF_COORD_TYPE;
import 'package:flutter_bmfbase/BaiduMap/bmfmap_base.dart';
import 'package:flutter_bmfmap/BaiduMap/bmfmap_map.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // 百度地图sdk初始化鉴权
  if (Platform.isIOS) {
    BMFMapSDK.setApiKeyAndCoordType(
        'jvaGGXUASaYLa4vnCKx4vT4VZk7y3sG0', BMF_COORD_TYPE.BD09LL);
  } else if (Platform.isAndroid) {
    // Android 目前不支持接口设置Apikey,
    // 请在主工程的Manifest文件里设置，详细配置方法请参考官网(https://lbsyun.baidu.com/)demo
    BMFMapSDK.setCoordType(BMF_COORD_TYPE.BD09LL);
  }
  runApp(new MyApp());
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  BMFMapOptions mapOptions;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Builder(
        builder: (context) {
          //360;
          //1209;
          return MapPageView();
        },
      ),
    );
  }
}

class MapPageView extends StatelessWidget {
  BMFMapOptions mapOptions;
  @override
  Widget build(BuildContext context) {
    mapOptions = BMFMapOptions(
        center: BMFCoordinate(39.917215, 116.380341),
        zoomLevel: 12,
        mapPadding: BMFEdgeInsets(left: 30, top: 0, right: 30, bottom: 0),
        showMapScaleBar: false);
   return Container(
      child: BMFMapWidget(
        onBMFMapCreated: (controller) {},
        mapOptions:mapOptions,
      ),
    );
  }
}

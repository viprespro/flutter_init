import 'dart:io';

import 'package:fllutter_demo/http.dart';
import 'package:fllutter_demo/provider/counter.dart';
import 'package:fllutter_demo/search_page.dart';
import 'package:fllutter_demo/service.dart';
import 'package:fllutter_demo/views/like_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:provider/provider.dart';

import 'dialog/loading.dart';

void main() => runApp(MultiProvider(
      // provider 注册
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Colors.blueAccent),
      home: HomePage(),
      // routes: {
      //   '/': (_) {
      //     return WebviewScaffold(
      //       url: 'https://www.baidu.com',
      //       mediaPlaybackRequiresUserGesture: false,
      //       appBar: AppBar(
      //         title: const Text('Widget WebView'),
      //       ),
      //       withZoom: true,
      //       withLocalStorage: true,
      //       hidden: true,
      //       initialChild: Container(
      //         color: Colors.redAccent,
      //         child: const Center(
      //           child: Text('Waiting.....'),
      //         ),
      //       ),
      //     );
      //   },
      // }
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            const Count(),
            RaisedButton(
              child: Text('点击跳转'),
              onPressed: () async {
                // 测试provider状态管理 点击进入即可
                // Navigator.of(context)
                //     .push(new MaterialPageRoute(builder: (context) {
                //   return SearchPage();
                // }));

                // 测试封装可复用组件
                // Navigator.of(context)
                //     .push(new MaterialPageRoute(builder: (context) {
                //   return LikeItem();
                // }));

                // 发起dio网络请求
                DemoDialog.showLoading(context);
                Map data = {'username': 'xiaopang1', 'password': '123456'};
                var res = await httpClient.post(API.login, data: data);
                print(res);
                DemoDialog.hideLoading(context);
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        /// Calls `context.read` instead of `context.watch` so that it does not rebuild
        /// when [Counter] changes.
        onPressed: () => context.read<Counter>().increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Count extends StatelessWidget {
  const Count({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(

        /// Calls `context.watch` to make [MyHomePage] rebuild when [Counter] changes.
        '${context.watch<Counter>().count}',
        style: Theme.of(context).textTheme.headline4);
  }
}

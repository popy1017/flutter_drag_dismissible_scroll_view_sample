import 'package:draggable_dismissible_scroll_view_sample/sliver_item_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'サンプル',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: (settings) {
        return MaterialWithModalsPageRoute(
          settings: settings,
          builder: (context) => Home(),
        );
      },
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: Text('表示するCustomScrollView'),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              onTap: () => _moveTo(context, SliverItemView()),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Sample1:'),
              subtitle: Text('showModalBottomSheetをそのまま使った場合'),
              trailing: const Icon(Icons.open_in_new),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (_) {
                    return SliverItemView();
                  },
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Sample2:'),
              subtitle: Text(
                  'modal_bottom_sheetパッケージのshowCupertinoModalBottomSheetをそのまま使った場合'),
              trailing: const Icon(Icons.open_in_new),
              onTap: () {
                showCupertinoModalBottomSheet(
                  context: context,
                  builder: (_) => SliverItemView(),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Sample3:'),
              subtitle: Text(
                  'modal_bottom_sheetパッケージのshowBarModalBottomSheetをそのまま使った場合'),
              trailing: const Icon(Icons.open_in_new),
              onTap: () {
                showBarModalBottomSheet(
                  context: context,
                  expand: true,
                  builder: (_) => SliverItemView(),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Sample4:'),
              subtitle: Text(
                  'showCupertinoModalBottomSheetに指定するWidgetをDraggableScrollableSheetでラップ'),
              trailing: const Icon(Icons.open_in_new),
              onTap: () {
                showCupertinoModalBottomSheet(
                  context: context,
                  expand: true,
                  builder: (_) => DraggableScrollableSheet(
                    initialChildSize: 1,
                    builder: (_, __) => SliverItemView(),
                  ),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Sample5:'),
              subtitle: Text(''),
              trailing: const Icon(Icons.open_in_new),
              onTap: () {
                showCupertinoModalBottomSheet(
                  context: context,
                  expand: true,
                  builder: (_) => DraggableScrollableSheet(
                    initialChildSize: 1,
                    builder: (_, __) => SliverItemView(),
                  ),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('☆Sample6: これが一番いいかも'),
              subtitle: Text('Navigator.pushとfullscreenDialog:trueで画面遷移'),
              trailing: const Icon(Icons.open_in_new),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SliverItemView(),
                    fullscreenDialog: true,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _moveTo(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => widget));
  }
}

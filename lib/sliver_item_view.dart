import 'package:flutter/material.dart';

const double _dismissThreshold = -70;

class SliverItemView extends StatefulWidget {
  @override
  _SliverItemViewState createState() => _SliverItemViewState();
}

class _SliverItemViewState extends State<SliverItemView> {
  final ScrollController _scrollController = ScrollController();

  // _onScrollChangedListenerが2回以上呼ばれてしまうため、
  // Navigator.popが何回も呼ばれ真っ黒い画面に飛ばされてしまうのを防ぐフラグ
  bool isFirstEvent = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScrollChangedListener);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.removeListener(_onScrollChangedListener);
  }

  void _onScrollChangedListener() {
    if (isFirstEvent && _scrollController.offset < _dismissThreshold) {
      isFirstEvent = false;
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        physics: AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            title: Text(this.toStringShort()),
            floating: true,
          ),
          SliverList(
            delegate: _buildSliverChildListDelegate(),
          ),
        ],
      ),
    );
  }

  SliverChildListDelegate _buildSliverChildListDelegate() {
    return SliverChildListDelegate(
      List.generate(
        2,
        (index) => Card(
          child: ListTile(
            title: Text('Item: $index'),
          ),
        ),
      ),
    );
  }
}

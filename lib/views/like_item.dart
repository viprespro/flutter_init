import 'package:flutter/material.dart';

class LikeItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text('测试组件可复用页面'),
        ),
        body: Column(
          children: [
            iconTextItem(
                lefIcon: Icon(
                  Icons.perm_camera_mic,
                  color: Color(0xff999999),
                ),
                leftText: '银行卡',
                rightIcon: Icon(
                  Icons.keyboard_arrow_right,
                  color: Color(0xffbbbbbb),
                ),
                // ignore: sdk_version_set_literal
                onPress: () => {print('123')}),
            iconTextItem(
                lefIcon: Icon(Icons.perm_camera_mic),
                leftText: '银行卡',
                rightIcon: Icon(
                  Icons.keyboard_arrow_right,
                  color: Color(0xffbbbbbb),
                )),
            iconTextItem(
                lefIcon: Icon(Icons.perm_camera_mic),
                leftText: '银行卡',
                rightIcon: Icon(
                  Icons.keyboard_arrow_right,
                  color: Color(0xffbbbbbb),
                ))
          ],
        ));
  }

  Widget iconTextItem(
      {Widget lefIcon,
      String leftText,
      String rightText = '',
      Widget rightIcon,
      Function onPress}) {
    return GestureDetector(
      child: Container(
          color: Colors.white,
          padding: EdgeInsets.only(left: 20, right: 16),
          child: SizedBox(
              height: 48,
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 1, color: Color(0xfff6f6f6)))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Wrap(
                      runAlignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: <Widget>[
                        lefIcon,
                        Padding(padding: EdgeInsetsDirectional.only(start: 10)),
                        Text('$leftText'),
                      ],
                    ),
                    Wrap(
                      runAlignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: <Widget>[
                        Text("$rightText"),
                        Padding(
                            padding: EdgeInsetsDirectional.only(start: 10),
                            child: rightIcon)
                      ],
                    ),
                  ],
                ),
              ))),
      onTap: onPress,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:my_google/global.dart';

class ottpage extends StatefulWidget {
  const ottpage({Key? key}) : super(key: key);

  @override
  State<ottpage> createState() => _ottpageState();
}

class _ottpageState extends State<ottpage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController searchController = TextEditingController();

  double progressVal = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Global.pullToRefreshController = PullToRefreshController(
        options: PullToRefreshOptions(color: Colors.blueGrey),
        onRefresh: () async {
          await Global.inAppWebViewController.reload();
        });
  }

  @override
  Widget build(BuildContext context) {
    var res = ModalRoute.of(context)!.settings.arguments;

    dynamic fromRes = res;

    String ottUrl = fromRes;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            (progressVal < 1)
                ? SizedBox(
                    height: 5,
                    child: LinearProgressIndicator(
                      value: progressVal,
                      color: Colors.green,
                      backgroundColor: Colors.grey,
                    ),
                  )
                : const SizedBox(),
            Expanded(
              child: InAppWebView(
                initialOptions: InAppWebViewGroupOptions(
                    android: AndroidInAppWebViewOptions(
                  useHybridComposition: true,
                )),
                pullToRefreshController: Global.pullToRefreshController,
                onProgressChanged: (controller, index) {
                  setState(() {
                    progressVal = index / 100;
                  });
                },
                initialUrlRequest: URLRequest(url: Uri.parse(ottUrl)),
                onWebViewCreated: (val) {
                  setState(() {
                    Global.inAppWebViewController = val;
                  });
                },
                onLoadStop: (controller, uri) async {
                  await Global.pullToRefreshController.endRefreshing();
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(width: 15,),
          FloatingActionButton(
            onPressed: () {
              Global.inAppWebViewController.goBack();
            },
            child: Icon(Icons.arrow_back_ios),
          ),
          FloatingActionButton(
            onPressed: () async {
              Uri? uri = await Global.inAppWebViewController.getUrl();

              Global.myBookMark.add(uri.toString());
            },
            child: const Icon(Icons.bookmark_border),
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.home),
          ),
          FloatingActionButton(
            onPressed: () {
              Global.inAppWebViewController.reload();
            },
            child: Icon(Icons.refresh),
          ),
          FloatingActionButton(
            onPressed: () {
              Global.inAppWebViewController.goForward();
            },
            child: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}

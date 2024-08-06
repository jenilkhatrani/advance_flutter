import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:lottie/lottie.dart';
import 'package:mirror_wall/provider/connectivityProvider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late InAppWebViewController inAppWebViewController;
  late PullToRefreshController pullToRefreshController;
  List<String> bookmarks = [];

  bool canGoBack = false;
  bool canGoForward = false;

  @override
  void initState() {
    super.initState();
    pullToRefreshController = PullToRefreshController(
      onRefresh: () async {
        inAppWebViewController.reload();
      },
    );

    Provider.of<ConnectivityProvider>(context, listen: false).checkConnectivity();
  }

  void _updateNavigationState() async {
    bool canGoBack = await inAppWebViewController.canGoBack();
    bool canGoForward = await inAppWebViewController.canGoForward();
    setState(() {
      this.canGoBack = canGoBack;
      this.canGoForward = canGoForward;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(

            flex: 17,

        child: (Provider.of<ConnectivityProvider>(context)
            .connecitivityModel
            .isInternet == false)?
             Center(child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Lottie.asset('assets/internet.json',height: 250),

                Text('No internet connection available',style: TextStyle(
                  fontSize: 18,fontWeight: FontWeight.bold,color: Colors.grey
                ),),
              ],
            ),):
        InAppWebView(
              initialUrlRequest: URLRequest(
                url: WebUri('https://www.google.com/'),
              ),
              onLoadStart: (controller, _) {
                inAppWebViewController = controller;
                _updateNavigationState();
              },
              pullToRefreshController: pullToRefreshController,
              onLoadStop: (controller, _) async {
                await pullToRefreshController.endRefreshing();
                _updateNavigationState();
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: canGoBack ? () async {
                    await inAppWebViewController.goBack();
                    _updateNavigationState();
                  } : null,
                  icon: Icon(Icons.arrow_back_ios, color: canGoBack ? Colors.black : Colors.grey),
                ),
                IconButton(
                  onPressed: () async {
                    inAppWebViewController.loadUrl(
                      urlRequest: URLRequest(
                        url: await inAppWebViewController.getUrl(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.refresh),
                ),
                IconButton(
                  onPressed: canGoForward ? () async {
                    await inAppWebViewController.goForward();
                    _updateNavigationState();
                  } : null,
                  icon: Icon(Icons.arrow_forward_ios, color: canGoForward ? Colors.black : Colors.grey),
                ),
                IconButton(
                  onPressed: () async {
                    await inAppWebViewController.loadUrl(
                      urlRequest: URLRequest(
                        url: WebUri('https://www.opera.com/'),
                      ),
                    );
                  },
                  icon: const Icon(Icons.home),
                ),
                IconButton(
                  onPressed: () async {
                    var url = await inAppWebViewController.getUrl();
                    if (url != null) {
                      setState(() {
                        bookmarks.add(url.toString());
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Bookmark added!')),
                      );
                    }
                  },
                  icon: const Icon(Icons.bookmark_add_sharp),
                ),
                IconButton(
                  onPressed: () {
                    showBookmarksDialog();
                  },
                  icon: const Icon(Icons.menu),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showBookmarksDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Bookmarks'),
          content: SizedBox(
            width: double.maxFinite,
            height: 400.0,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: bookmarks.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(bookmarks[index]),
                  onTap: () {
                    Navigator.of(context).pop();
                    inAppWebViewController.loadUrl(
                      urlRequest: URLRequest(url: WebUri(bookmarks[index])),
                    );
                  },
                );
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

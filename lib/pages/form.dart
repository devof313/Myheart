import 'package:flutter/material.dart';
import 'package:heartapp/auth/main_page.dart';
import 'package:heartapp/pages/healthinfo.dart';
import 'package:heartapp/pages/quizform.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  //controllers
  PageController _controller = PageController();

  //keep track if we are on the last page
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //page view
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 1);
              });
            },
            //the pages for the questions
            children: [
              MyInfo(),
              Q1(),
            ],
          ),
          //dot indicators
          Container(
            alignment: Alignment(0, 0.8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //skip
                GestureDetector(
                  onTap: () {
                    _controller.previousPage(
                      duration: Duration(microseconds: 500),
                      curve: Curves.easeIn,
                    );
                  },
                  child: Text('BACK',
                      style: TextStyle(color: Colors.black, fontSize: 19)),
                ),

                //dot indicator
                SmoothPageIndicator(controller: _controller, count: 2),

                //next or done
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MainPage()),
                          );
                        },
                        child: Text('DONE',
                            style:
                                TextStyle(color: Colors.black, fontSize: 19)),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                            duration: Duration(microseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Text('NEXT',
                            style:
                                TextStyle(color: Colors.black, fontSize: 19)),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp_ftl/pages/index_page/index_components/index_components.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  late bool isBack = false;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(375, 812),
      minTextAdapt: true,
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue[900],
      body: Padding(
        padding: EdgeInsets.all(30.0.r),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              iconExit,
              const Spacer(),
              headerLogo,
              SizedBox(
                height: 50.h,
              ),
              textInfo,
              SizedBox(
                height: 30.h,
              ),
              builderButton(
                'Sign in with token',
                Colors.white,
                const Color.fromRGBO(13, 71, 161, 1),
                Colors.white,
                Icons.key,
                () {},
              ),
              SizedBox(
                height: 15.h,
              ),
              builderButton(
                'Create an account',
                const Color.fromRGBO(13, 71, 161, 1),
                Colors.white,
                Colors.white,
                null,
                () {
                  Navigator.pushNamed(context, 'RegistrationPage');
                },
              ),
              SizedBox(
                height: 40.h,
              ),
              textFooter(context),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isBack = !isBack;
                      });
                      Navigator.pushNamed(context, 'IndexPage');
                    },
                    icon: isBack
                        ? const Icon(Icons.back_hand)
                        : const SizedBox.shrink(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

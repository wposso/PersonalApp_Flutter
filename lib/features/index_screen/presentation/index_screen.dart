import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp_ftl/features/index_screen/presentation/widgets/index_components.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
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
                  Navigator.pushNamed(context, 'RegistrationScreen');
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
                      Navigator.pushNamed(context, 'IndexScreen');
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp_ftl/features/profile_screen/presentation/widgets/widgets.dart';
import 'package:myapp_ftl/features/login_screen/data/service/login_service.dart';
import 'package:myapp_ftl/features/profile_screen/data/service/profile_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfileScreen> {
  final ObtenerUsuarios _obtenerusuarios = ObtenerUsuarios();
  final GetUserData _getuserdata = GetUserData();

  String? getemail = 'Not email';
  String getfirstname = '';
  String getlastname = '';
  // String

  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    try {
      await _obtenerusuarios.obtenerusuarios();
      getUser();
      await _getuserdata.getuserdata();
      getuserdata();
    } catch (x) {
      debugPrint('Error al obtener los datos: $x');
    }
  }

  void getUser() {
    if (_obtenerusuarios.listaUsuarios.isNotEmpty) {
      final firstdata = _obtenerusuarios.listaUsuarios.first;
      setState(() {
        getemail = firstdata['Email'] ?? 'Not email';
      });
    } else {
      debugPrint('La lista de usuarios esta vacia');
    }
  }

  void getuserdata() {
    if (_getuserdata.userdatalist.isNotEmpty) {
      final user = _getuserdata.userdatalist.first;
      setState(() {
        getfirstname = user['FirstName'] ?? 'Not first name';
        getlastname = user['LastName'] ?? 'Not last name';
      });
    } else {
      debugPrint('List empty');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 10.r, bottom: 20.r),
          decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.r),
                  bottomRight: Radius.circular(40.r))),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                  ),
                  Text(
                    'Details',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 20.sp),
                  )
                ],
              ),
              SizedBox(
                height: 10.r,
              ),
              CircleAvatar(
                radius: 40.r,
                child: ClipOval(
                  child: Image.asset(
                    'assets/image_profile.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 10.r,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    getfirstname,
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 19.sp),
                  ),
                  SizedBox(
                    width: 5.r,
                  ),
                  Text(
                    getlastname,
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 19.sp),
                  ),
                ],
              ),
              Text(
                'Flutter Jr Developer',
                style: GoogleFonts.poppins(color: Colors.white),
              ),
              SizedBox(
                height: 20.r,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildContainer(Icons.favorite),
                  SizedBox(
                    width: 5.r,
                  ),
                  buildContainer(Icons.code),
                  SizedBox(
                    width: 3.r,
                  ),
                  Text(
                    '|',
                    style: GoogleFonts.poppins(
                        fontSize: 50.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w200),
                  ),
                  SizedBox(
                    width: 3.r,
                  ),
                  buildContainer(Icons.location_on),
                  SizedBox(
                    width: 5.r,
                  ),
                  buildContainer(Icons.notifications_active),
                ],
              )
            ],
          ),
        ),
        Flexible(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(15.r),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500, fontSize: 16.sp),
                      )
                    ],
                  ),
                  buildListtileA(
                      Icons.mail, 'Official', getemail ?? 'Not email', null),
                  SizedBox(
                    height: 5.r,
                  ),
                  buildListtileA(
                      Icons.mail, 'Personal', getemail ?? 'Not email', null),
                  const Divider(),
                  SizedBox(
                    height: 5.r,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Mobile number',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500, fontSize: 16.sp),
                      ),
                    ],
                  ),
                  buildListtileB(
                    Icons.phone,
                    '(+57) 3246357219)',
                    null,
                  ),
                  const Divider(),
                  SizedBox(
                    height: 5.r,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Team',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500, fontSize: 16.sp),
                      ),
                    ],
                  ),
                  buildListtileB(
                    Icons.groups_sharp,
                    'Project operation team',
                    Container(
                      padding: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 2, color: Colors.indigo)),
                      child: const Icon(Icons.arrow_forward),
                    ),
                  ),
                  SizedBox(
                    height: 5.r,
                  ),
                  const Divider(),
                  SizedBox(
                    height: 5.r,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Leads by',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500, fontSize: 16.sp),
                      ),
                    ],
                  ),
                  buildListtileB(
                    Icons.code,
                    'Software developer',
                    Container(
                      padding: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 2, color: Colors.indigo)),
                      child: const Icon(Icons.arrow_forward),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

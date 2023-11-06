import 'dart:ui';

import 'package:farm/components/Mytext.dart';
import 'package:farm/components/MyRadioBtn.dart';
import 'package:farm/components/TextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../model/User.dart';
import 'package:farm/config/theme/AppColor.dart';
import 'package:flutter/cupertino.dart';

class WebsitePage extends StatefulWidget {
  const WebsitePage({super.key});

  @override
  State<WebsitePage> createState() => _WebsitePageState();
}

class _WebsitePageState extends State<WebsitePage> {
  late Future<User> user;
  int _radioValue = 0;
  bool isEnableMyTextFormField = false;
  bool turnOnEmail = false;
  bool turnOnPhonNum = false;
  @override
  void initState() {
    super.initState();
    user = fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Container(
        child: FutureBuilder<User>(
            future: user,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Text('error: ${snapshot.error}');
                }
                return Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(242, 244, 246, 1),
                  ),
                  child: Column(children: [
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: screenHeight * 0.2,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              width: screenWidth,
                              height: screenHeight * 0.10,
                              decoration:
                                  BoxDecoration(gradient: AppColor.gradien[50]),
                              child: AppBar(
                                elevation: 0,
                                backgroundColor: Colors.black,
                                title: Container(
                                  height: screenWidth * 0.25,
                                  width: screenWidth * 0.25,
                                  // width: 100,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: new NetworkImage(snapshot
                                                  .data?.imgLink ??
                                              "https://i.stack.imgur.com/l60Hf.png"),
                                          fit: BoxFit.cover)),
                                ),
                                actions: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isEnableMyTextFormField =
                                            !isEnableMyTextFormField;
                                      });
                                    },
                                    icon:
                                        const Icon(Icons.border_color_outlined),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isEnableMyTextFormField =
                                            !isEnableMyTextFormField;
                                      });
                                    },
                                    icon:
                                        const Icon(Icons.border_color_outlined),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: screenWidth * 0.9,
                      height: screenHeight * 0.3,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('lib/images/DuBaoThoiTiet.png'),
                              fit: BoxFit.cover)),
                      // child: Text('this is container'),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          screenWidth * 0.05,
                          screenHeight * 0.03,
                          screenWidth * 0.05,
                          screenWidth * 0.05),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(screenWidth * 0.03,
                                    0, 0, screenWidth * 0.03),
                                child: const Text(
                                  'Thông tin cơ bản',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                          Container(
                              width: screenWidth,
                              height: screenHeight * 0.4,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: kElevationToShadow[3]),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: screenHeight * 0.02,
                                    left: screenWidth * 0.04,
                                    right: screenWidth * 0.04),
                                child: Column(
                                  children: [
                                    // TextField()
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        MyText(
                                          text: 'Họ và tên',
                                          fontSize: 14,
                                          color: AppColor.subText[50],
                                          fontWeight: FontWeight.bold,
                                        ),
                                        MyText(
                                          text: "Giới tính                ",
                                          fontSize: 14,
                                          color: AppColor.subText[50],
                                          fontWeight: FontWeight.bold,
                                        )
                                      ],
                                    ),

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // MyTextFormField(
                                        //     isEnabled: isEnableMyTextFormField,
                                        //     text: '${snapshot.data?.name}'
                                        //         .toUpperCase())
                                        Container(
                                            width: screenWidth * 0.5,
                                            height: screenHeight * 0.05,
                                            child: MyTextFormField(
                                                isEnabled:
                                                    isEnableMyTextFormField,
                                                text:
                                                    '${snapshot.data?.name}')),

                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              MyRadioBtn(
                                                onChanged:
                                                    isEnableMyTextFormField
                                                        ? (value) {
                                                            setState(() {
                                                              snapshot.data
                                                                      ?.sex =
                                                                  value!;
                                                            });
                                                          }
                                                        : (value) {},
                                                value: 0,
                                                groupValue:
                                                    snapshot.data!.sex ?? 0,
                                                icon: Icons.male_rounded,
                                                icoColor: Color.fromRGBO(
                                                    77, 128, 216, 1),
                                              ),
                                              MyRadioBtn(
                                                onChanged:
                                                    isEnableMyTextFormField
                                                        ? (value) {
                                                            setState(() {
                                                              snapshot.data
                                                                      ?.sex =
                                                                  value!;
                                                            });
                                                          }
                                                        : (value) {},
                                                value: 1,
                                                groupValue:
                                                    snapshot.data!.sex ?? 0,
                                                icon: Icons.female_sharp,
                                                icoColor: Color.fromRGBO(
                                                    229, 81, 144, 1),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      color: AppColor.subText[50],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        MyText(
                                          text: 'Email',
                                          fontSize: 14,
                                          color: AppColor.subText[50],
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),

                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          // MyTextFormField(
                                          //     isEnabled: isEnableMyTextFormField,
                                          //     text: '${snapshot.data?.name}'
                                          //         .toUpperCase())
                                          Container(
                                              width: screenWidth * 0.8,
                                              height: screenHeight * 0.05,
                                              child: MyTextFormField(
                                                  isEnabled:
                                                      isEnableMyTextFormField,
                                                  text:
                                                      '${snapshot.data?.email}')),
                                        ]),
                                    Divider(
                                      color: AppColor.subText[50],
                                      // thickness: 1.5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        MyText(
                                          text: 'Số điện thoại',
                                          fontSize: 14,
                                          color: AppColor.subText[50],
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),

                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          // MyTextFormField(
                                          //     isEnabled: isEnableMyTextFormField,
                                          //     text: '${snapshot.data?.name}'
                                          //         .toUpperCase())
                                          Container(
                                              width: screenWidth * 0.8,
                                              height: screenHeight * 0.05,
                                              child: MyTextFormField(
                                                  isEnabled:
                                                      isEnableMyTextFormField,
                                                  text:
                                                      '${snapshot.data?.phoneNumber}')),
                                        ]),
                                    Divider(
                                      color: AppColor.subText[50],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        MyText(
                                          text: 'Ngày sinh',
                                          fontSize: 14,
                                          color: AppColor.subText[50],
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),

                                    // MyTextFormField(
                                    //     isEnabled: isEnableMyTextFormField,
                                    //     text: '${snapshot.data?.name}'
                                    //         .toUpperCase())
                                    CupertinoButton(
                                      onPressed: isEnableMyTextFormField
                                          ? () {
                                              showCupertinoModalPopup(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) =>
                                                          SizedBox(
                                                            height: 120,
                                                            child:
                                                                CupertinoDatePicker(
                                                              mode:
                                                                  CupertinoDatePickerMode
                                                                      .date,
                                                              //  use24hFormat: true,
                                                              backgroundColor:
                                                                  Colors.white,

                                                              initialDateTime: DateTime(
                                                                  int.parse(
                                                                      '${snapshot.data!.birthday?.split('/')[2]}'),
                                                                  int.parse(
                                                                      '${snapshot.data!.birthday?.split('/')[1]}'),
                                                                  int.parse(
                                                                      '${snapshot.data!.birthday?.split('/')[0]}')),
                                                              onDateTimeChanged:
                                                                  (DateTime
                                                                      newTime) {
                                                                setState(() => snapshot
                                                                        .data
                                                                        ?.birthday =
                                                                    ('${newTime.day}/${newTime.month}/${newTime.year}'));
                                                              },
                                                            ),
                                                          ));
                                            }
                                          : null,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                                boxShadow:
                                                    kElevationToShadow[4]),
                                            width: screenWidth * 0.8,
                                            height: screenHeight * 0.04,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                MyText(
                                                  text:
                                                      '${snapshot.data?.birthday?.split('/')[0]}',
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10, bottom: 10),
                                                  child: VerticalDivider(
                                                    color: Colors.black,
                                                    thickness: 2,
                                                  ),
                                                ),
                                                MyText(
                                                  text:
                                                      'Tháng ${snapshot.data?.birthday?.split('/')[1]}',
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10, bottom: 10),
                                                  child: VerticalDivider(
                                                    thickness: 2,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                MyText(
                                                  text:
                                                      '${snapshot.data?.birthday?.split('/')[2]}',
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ],
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(screenWidth * 0.05, 0,
                            screenWidth * 0.05, screenWidth * 0.05),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      screenWidth * 0.03,
                                      0,
                                      0,
                                      screenWidth * 0.03),
                                  child: const Text(
                                    'Mật khẩu và bảo mật',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                                width: screenWidth,
                                height: screenHeight * 0.3,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: kElevationToShadow[3]),
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        top: screenHeight * 0.02,
                                        left: screenWidth * 0.04,
                                        right: screenWidth * 0.04),
                                    child: Column(children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              MyText(
                                                text: 'Đổi mật khẩu',
                                                fontWeight: FontWeight.bold,
                                              )
                                            ],
                                          ),
                                          Container(
                                            height: 50,
                                            width: screenWidth * 0.8,
                                            decoration: BoxDecoration(
                                                boxShadow:
                                                    kElevationToShadow[3],
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 1),
                                                borderRadius:
                                                    BorderRadius.circular(3)),
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: screenHeight * 0.01,
                                                  right: screenHeight * 0.01),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                        height:
                                                            screenWidth * 0.1,
                                                        width:
                                                            screenWidth * 0.1,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50),
                                                            color:
                                                                Color.fromRGBO(
                                                                    0,
                                                                    0,
                                                                    0,
                                                                    0.8)),
                                                        child: Icon(
                                                          Icons.lock,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                            left: screenWidth *
                                                                0.02),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            MyText(
                                                              text: 'MẬT KHẨU'
                                                                  .toUpperCase(),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              // color:
                                                              //     Colors.white,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  TextButton(
                                                    onPressed: () {},
                                                    child: MyText(
                                                      text: 'ĐỔI MẬT KHẨU',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                    style: TextButton.styleFrom(
                                                        backgroundColor:
                                                            Color.fromRGBO(
                                                                0, 0, 0, 0.8)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Divider(
                                            color: AppColor.subText[50],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              MyText(
                                                text: 'xác thực hai yếu tố',
                                                fontWeight: FontWeight.bold,
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            height: 50,
                                            width: screenWidth * 0.8,
                                            decoration: BoxDecoration(
                                                boxShadow:
                                                    kElevationToShadow[3],
                                                color: turnOnEmail
                                                    ? AppColor.primary[50]
                                                    : Color.fromRGBO(
                                                        0, 0, 0, 0.7),
                                                borderRadius:
                                                    BorderRadius.circular(3)),
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: screenHeight * 0.01,
                                                  right: screenHeight * 0.01),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                        height:
                                                            screenWidth * 0.1,
                                                        width:
                                                            screenWidth * 0.1,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50),
                                                            color:
                                                                Colors.white),
                                                        child: Icon(Icons
                                                            .email_outlined),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                            left: screenWidth *
                                                                0.02),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            MyText(
                                                              text: 'EMAIL'
                                                                  .toUpperCase(),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            // MyText(
                                                            //   text: turnOnEmail
                                                            //       ? 'ĐÃ BẬT'
                                                            //       : 'ĐÃ TẮT'
                                                            //           .toUpperCase(),
                                                            //   fontWeight:
                                                            //       FontWeight
                                                            //           .bold,
                                                            //   fontSize: 10,
                                                            //   color:
                                                            //       Colors.white,
                                                            // )
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        turnOnEmail =
                                                            !turnOnEmail;
                                                      });
                                                    },
                                                    child: MyText(
                                                      text: turnOnEmail
                                                          ? 'TẮT'
                                                          : 'BẬT',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    style: TextButton.styleFrom(
                                                        backgroundColor:
                                                            Colors.white),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            height: 50,
                                            width: screenWidth * 0.8,
                                            decoration: BoxDecoration(
                                                boxShadow:
                                                    kElevationToShadow[3],
                                                color: turnOnPhonNum
                                                    ? AppColor.primary[50]
                                                    : Color.fromRGBO(
                                                        0, 0, 0, 0.7),
                                                borderRadius:
                                                    BorderRadius.circular(3)),
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: screenHeight * 0.01,
                                                  right: screenHeight * 0.01),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                        height:
                                                            screenWidth * 0.1,
                                                        width:
                                                            screenWidth * 0.1,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50),
                                                            color:
                                                                Colors.white),
                                                        child: Icon(Icons
                                                            .local_phone_sharp),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                            left: screenWidth *
                                                                0.02),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            MyText(
                                                              text: 'ĐIỆN THOẠI'
                                                                  .toUpperCase(),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            // MyText(
                                                            //   text: turnOnPhonNum
                                                            //       ? 'ĐÃ BẬT'
                                                            //       : 'ĐÃ TẮT'
                                                            //           .toUpperCase(),
                                                            //   fontWeight:
                                                            //       FontWeight
                                                            //           .bold,
                                                            //   fontSize: 10,
                                                            //   color:
                                                            //       Colors.white,
                                                            // )
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        turnOnPhonNum =
                                                            !turnOnPhonNum;
                                                      });
                                                    },
                                                    child: MyText(
                                                      text: turnOnPhonNum
                                                          ? 'TẮT'
                                                          : 'BẬT',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    style: TextButton.styleFrom(
                                                        backgroundColor:
                                                            Colors.white),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ])))
                          ],
                        )),
                  ]),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColor.primary[50],
                  ),
                );
              }
            }),
      ),
    );
  }
}

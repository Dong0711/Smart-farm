import 'package:farm/components/Mytext.dart';
import 'package:farm/components/MyRadioBtn.dart';
import 'package:farm/components/TextField.dart';
import 'package:flutter/material.dart';
import '../model/User.dart';
import 'package:farm/config/theme/AppColor.dart';
import 'package:flutter/cupertino.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late Future<User> user;
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
    double screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        children: [
          FutureBuilder<User>(
              future: user,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Text('error: ${snapshot.error}');
                  }
                  return Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(children: [
                      SizedBox(
                        height: 200,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                width: screenWidth,
                                height: 150,
                                decoration: BoxDecoration(
                                    gradient: AppColor.gradien[50]),
                                child: Column(
                                  children: [
                                    AppBar(
                                      elevation: 0,
                                      backgroundColor: Colors.transparent,
                                      centerTitle: true,
                                      actions: [
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              isEnableMyTextFormField =
                                                  !isEnableMyTextFormField;
                                            });
                                          },
                                          icon: const Icon(
                                              Icons.border_color_outlined),
                                        )
                                      ],
                                    ),
                                    const MyText(
                                      text: "THÔNG TIN CỦA TÔI",
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 100,
                              child: Container(
                                height: 100,
                                width: 100,
                                // width: 100,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage(snapshot
                                                .data?.imgLink ??
                                            "https://i.stack.imgur.com/l60Hf.png"),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      MyText(
                        text: '${snapshot.data?.name?.toUpperCase()}',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      GestureDetector(
                        onTap: () {
                          //todo
                        },
                        child: TextButton(
                          onPressed: () {},
                          child: const MyText(
                            text: 'Thay đổi ảnh đại diện',
                            color: Colors.grey,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Thông tin cơ bản',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                            ),
                            Container(
                                width: 500,
                                height: 400,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: kElevationToShadow[3]),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
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
                                            text: "Giới tính            ",
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
                                          SizedBox(
                                              width: 250,
                                              height: 50,
                                              child: MyTextFormField(
                                                  isEnabled:
                                                      isEnableMyTextFormField,
                                                  text:
                                                      '${snapshot.data?.name}')),

                                          Row(
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
                                                icoColor: const Color.fromRGBO(
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
                                                icoColor: const Color.fromRGBO(
                                                    229, 81, 144, 1),
                                              ),
                                            ],
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
                                            SizedBox(
                                                width: 400,
                                                height: 50,
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
                                            SizedBox(
                                                width: 400,
                                                height: 50,
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
                                                    builder: (BuildContext
                                                            context) =>
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
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(3),
                                                  boxShadow:
                                                      kElevationToShadow[4]),
                                              width: 400,
                                              height: 40,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  MyText(
                                                    text:
                                                        '${snapshot.data?.birthday?.split('/')[0]}',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  const Padding(
                                                    padding: EdgeInsets.only(
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
                                                  const Padding(
                                                    padding: EdgeInsets.only(
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
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      'Mật khẩu và bảo mật',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                  width: 500,
                                  height: 300,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: kElevationToShadow[3]),
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 20),
                                      child: Column(children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Row(
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
                                              margin: const EdgeInsets.only(top: 10),
                                              height: 50,
                                              width: 400,
                                              decoration: BoxDecoration(
                                                  boxShadow:
                                                      kElevationToShadow[3],
                                                  color: const Color.fromRGBO(
                                                      255, 255, 255, 1),
                                                  borderRadius:
                                                      BorderRadius.circular(3)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Container(
                                                          height: 40,
                                                          width: 40,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          50),
                                                              color: const Color
                                                                  .fromRGBO(0,
                                                                  0, 0, 0.8)),
                                                          child: const Icon(
                                                            Icons.lock,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets.only(
                                                                  left: 20),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
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
                                                      style:
                                                          TextButton.styleFrom(
                                                              backgroundColor:
                                                                  const Color
                                                                      .fromRGBO(
                                                                      0,
                                                                      0,
                                                                      0,
                                                                      0.8)),
                                                      child: const MyText(
                                                        text: 'ĐỔI MẬT KHẨU',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Divider(
                                              color: AppColor.subText[50],
                                            ),
                                            const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                MyText(
                                                  text: 'xác thực hai yếu tố',
                                                  fontWeight: FontWeight.bold,
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              height: 50,
                                              width: 400,
                                              decoration: BoxDecoration(
                                                  boxShadow:
                                                      kElevationToShadow[3],
                                                  color: turnOnEmail
                                                      ? AppColor.primary[50]
                                                      : const Color.fromRGBO(
                                                          0, 0, 0, 0.7),
                                                  borderRadius:
                                                      BorderRadius.circular(3)),
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                          height: 40,
                                                          width: 40,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          50),
                                                              color:
                                                                  Colors.white),
                                                          child: const Icon(Icons
                                                              .email_outlined),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets.only(
                                                                  left: 10),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              MyText(
                                                                text: 'EMAIL'
                                                                    .toUpperCase(),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white,
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
                                                      style:
                                                          TextButton.styleFrom(
                                                              backgroundColor:
                                                                  Colors.white),
                                                      child: MyText(
                                                        text: turnOnEmail
                                                            ? 'TẮT'
                                                            : 'BẬT',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              height: 50,
                                              width: 400,
                                              decoration: BoxDecoration(
                                                  boxShadow:
                                                      kElevationToShadow[3],
                                                  color: turnOnPhonNum
                                                      ? AppColor.primary[50]
                                                      : const Color.fromRGBO(
                                                          0, 0, 0, 0.7),
                                                  borderRadius:
                                                      BorderRadius.circular(3)),
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                          height: 40,
                                                          width: 40,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          50),
                                                              color:
                                                                  Colors.white),
                                                          child: const Icon(Icons
                                                              .local_phone_sharp),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets.only(
                                                                  left: 10),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
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
                                                                color: Colors
                                                                    .white,
                                                              ),
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
                                                      style:
                                                          TextButton.styleFrom(
                                                              backgroundColor:
                                                                  Colors.white),
                                                      child: MyText(
                                                        text: turnOnPhonNum
                                                            ? 'TẮT'
                                                            : 'BẬT',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
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
        ],
      ),
    );
  }
}

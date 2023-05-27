import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:reasa/app/Model/chatmodel.dart';
import 'package:reasa/app/Model/user_model.dart';
import 'package:reasa/app/data/constants.dart';
import 'package:reasa/app/data/typography.dart';
import 'package:reasa/app/modules/home/Widgets/chattextfeild.dart';
import 'package:reasa/app/modules/home/Widgets/getback.dart';
import 'package:reasa/app/modules/home/Widgets/show_menu_pop.dart';
import 'package:reasa/app/modules/home/Widgets/wrapper.dart';
import 'package:reasa/app/modules/home/controllers/chat_controller.dart';
import 'package:reasa/app/modules/home/views/Chat/Widgets/sender_and_reciver.container.dart';
import 'package:reasa/app/modules/home/views/Chat/camera_photo.dart';
import 'package:reasa/app/modules/home/views/Chat/video_call_screen.dart';
import 'package:reasa/app/modules/home/views/Chat/voice_call.dart';

class ChatPage extends StatefulWidget {
  final Message message;

  ChatPage({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ChatController _chatController = Get.put(ChatController());
  final ScrollController _scrollController = ScrollController();
  late final StreamSubscription<List<Message>> _messageSubscription;
/**  */
  var chatcontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _messageSubscription = _chatController.messages.listen((messages) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
        }
      });
      print(messages);
    });
  }

  @override
  void dispose() {
    _messageSubscription.cancel();
    _chatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Message messages;

    return BackGroundWrapper(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(64.h),
              child: AppBar(
                titleSpacing: 0,
                elevation: 0,
                actions: [
                  IconButton(
                    icon: Icon(
                      IconlyLight.call,
                      size: 24.sp,
                      color: CustomColor.kgrey900,
                    ),
                    onPressed: () {
                      Get.to(() => VoiceCallScreen());
                    },
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    icon: Icon(
                      IconlyLight.video,
                      size: 24.sp,
                      color: CustomColor.kgrey900,
                    ),
                    onPressed: () {
                      Get.to(() => VideoCallScreen());
                    },
                  ),
                  SizedBox(width: 17.w),
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    icon: Icon(
                      IconlyLight.more_circle,
                      size: 24.sp,
                      color: CustomColor.kgrey900,
                    ),
                    onPressed: () {
                      ShowMenuPop(context);
                    },
                  ),
                  SizedBox(width: 24.w),
                ],
                backgroundColor: CustomColor.kbackgroundwhite,
                title: widget.message.sender.name.h4(
                    color: CustomColor.kgrey900,
                    fontWeight: CustomFontWeight.kBoldFontWeight),
                leading: GetBackIcon(),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(children: [
                Expanded(
                  child: Obx(() => ListView.separated(
                        controller: _scrollController,
                        padding: EdgeInsets.all(24.h),
                        itemCount: _chatController.messages.length,
                        itemBuilder: (BuildContext context, int index) {
                          messages = _chatController.messages[index];
                          final bool isMe =
                              messages.sender.id == currentuser.id;

                          return isMe
                              ? SenderTextWidget(text: messages.text)
                              : ReciverTextWidget(text: messages.text);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 24.h,
                          );
                        },
                      )),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(24.w, 12.h, 24.w, 36.h),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 56.h,
                        width: 312.w,
                        child: ChatTextFeild(
                          controller: chatcontroller,
                          onattachpresssed: () {},
                          onsmileypresssed: () {},
                          oncamerapresssed: () {
                            Get.to(() => CameraScreen());
                          },
                          hintText: 'Type a message ...',
                          onChanged: (String) {},
                          textInputType: TextInputType.multiline,
                        ),
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      GestureDetector(
                        onTap: () {
                          _chatController.sendMessage(Message(
                            sender: User(name: 'John Doe', id: 25, image: ""),
                            time: DateTime.now().toString(),
                            text: chatcontroller.text,
                            isread: false,
                          ));
                          chatcontroller.clear();
                        },
                        child: Container(
                          height: 56.h,
                          width: 56.w,
                          decoration: BoxDecoration(
                            color: CustomColor.kprimaryblue,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              IconlyBold.send,
                              size: 24.sp,
                              color: CustomColor.kbackgroundwhite,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ]),
            )));
  }
}

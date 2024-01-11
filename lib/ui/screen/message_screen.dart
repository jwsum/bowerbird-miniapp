import 'package:collection/collection.dart';
import 'package:bowerbird_miniapp/model/message.dart';
import 'package:bowerbird_miniapp/model/message_group_member.dart';
import 'package:bowerbird_miniapp/model/user.dart';
import 'package:bowerbird_miniapp/provider/auth_provider.dart';
import 'package:bowerbird_miniapp/provider/message_group_provider.dart';
import 'package:bowerbird_miniapp/ui/widget/custom_textformfield.dart';
import 'package:bowerbird_miniapp/util/constant.dart';
import 'package:bowerbird_miniapp/util/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessageScreen extends ConsumerStatefulWidget {
  final String messageGroupId;
  const MessageScreen({super.key, required this.messageGroupId});

  @override
  MessageScreenState createState() => MessageScreenState();
}

class MessageScreenState extends ConsumerState<MessageScreen> {
  TextEditingController messageTextController = TextEditingController();
  bool _isSendButtonEnabled = false;

  void onSendMessage(String groupMemberId, String message) {
    if (message.trim().isNotEmpty) {
      ref.read(messageProvider(widget.messageGroupId).notifier).sendMessage(
          messageGroupId: widget.messageGroupId,
          messageGroupMemberId: groupMemberId,
          message: message);
      messageTextController.clear();
      setState(() {
        _isSendButtonEnabled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<MessageGroupMember>> messageGroupMember =
        ref.watch(messageGroupMemberProvider(widget.messageGroupId));
    User? user = ref.watch(userProvider);
    String userId = user?.id ?? "";

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Message",
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(color: Colors.white),
          ),
          backgroundColor: Theme.of(context).primaryColor,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SafeArea(
            child: switch (messageGroupMember) {
          AsyncData(:final value) => value.isEmpty
              ? const SizedBox.shrink()
              : Column(
                  children: <Widget>[
                    // List of messages
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: PaddingConstant.defaultPadding),
                        child: buildListMessage(userId, value),
                      ),
                    ),
                    // Input content
                    messageTextField(userId, value)
                  ],
                ),
          AsyncError() => const Center(
              child: Text('Oops, something unexpected happened'),
            ),
          _ => const LinearProgressIndicator(),
        }));
  }

  Widget buildListMessage(
      String userId, List<MessageGroupMember> groupMemberList) {
    final AsyncValue<List<Message>> message =
        ref.watch(messageProvider(widget.messageGroupId));
    return switch (message) {
      AsyncData(:final value) => value.isEmpty
          ? const Center(
              child: Text('Seems like there is no message yet!'),
            )
          : RefreshIndicator(
              onRefresh: () async {
                await ref
                    .watch(messageProvider(widget.messageGroupId).notifier)
                    .refreshMessage();
              },
              child: ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) {
                  value.sort((a, b) {
                    DateTime dateTimeA = DateTime.parse(a.updatedAt);
                    DateTime dateTimeB = DateTime.parse(b.updatedAt);
                    return dateTimeA.compareTo(dateTimeB);
                  });

                  Message message = value[index];
                  bool isUserMessage = userId == message.userId;
                  return buildMessage(isUserMessage, message, groupMemberList);
                },
              ),
            ),
      AsyncError() => const Center(
          child: Text('Oops, something unexpected happened'),
        ),
      _ => const LinearProgressIndicator(),
    };
  }

  Widget buildMessage(
      bool isUser, Message message, List<MessageGroupMember> groupMemberList) {
    Color groupMemberColor = groupMemberList.isNotEmpty
        ? ColorConstant.messageColorList[groupMemberList.indexWhere(
            (element) => element.id == message.messageGroupMemberId)]
        : ColorConstant.messageColorList.first;
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment:
          isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kDefaultBorderRadius),
              color: isUser
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).primaryColor.withOpacity(0.8)),
          padding: const EdgeInsets.symmetric(
            vertical: PaddingConstant.halfPadding,
            horizontal: PaddingConstant.defaultPadding,
          ),
          margin: const EdgeInsets.symmetric(
              vertical: PaddingConstant.quarterPadding),
          child: Column(
            crossAxisAlignment:
                isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              if (!isUser)
                Text(
                  message.username ?? "",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: groupMemberColor, fontWeight: FontWeight.bold),
                ),
              Text(
                message.message,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              ),
              Text(
                Util.getTimeFromString(message.createdAt),
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 10),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget messageTextField(
      String userId, List<MessageGroupMember> groupMemberList) {
    String userGroupMemberId = groupMemberList
            .firstWhereOrNull((groupMember) => groupMember.userId == userId)
            ?.id ??
        "";
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      constraints: const BoxConstraints(minHeight: 24),
      padding: const EdgeInsets.symmetric(
          vertical: PaddingConstant.halfPadding,
          horizontal: PaddingConstant.defaultPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.only(bottom: PaddingConstant.quarterPadding),
              child: CustomTextFormField(
                controller: messageTextController,
                minLines: 1,
                maxLines: 5,
                onChanged: (value) {
                  setState(() {
                    if (value.isEmpty && _isSendButtonEnabled) {
                      setState(() {
                        _isSendButtonEnabled = false;
                      });
                    } else if (value.isNotEmpty & !_isSendButtonEnabled) {
                      setState(() {
                        _isSendButtonEnabled = true;
                      });
                    }
                  });
                },
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(FocusNode());
                  onSendMessage(userGroupMemberId, messageTextController.text);
                },
              ),
            ),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            disabledColor: Colors.grey,
            color: Colors.green,
            icon: const Icon(
              Icons.send_rounded,
            ),
            onPressed: _isSendButtonEnabled
                ? () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    onSendMessage(
                        userGroupMemberId, messageTextController.text);
                  }
                : null,
          ),
        ],
      ),
    );
  }
}

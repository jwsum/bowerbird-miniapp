import 'package:bowerbird_miniapp/model/message.dart';
import 'package:bowerbird_miniapp/model/message_group.dart';
import 'package:bowerbird_miniapp/provider/auth_provider.dart';
import 'package:bowerbird_miniapp/provider/message_group_provider.dart';
import 'package:bowerbird_miniapp/ui/screen/message_screen.dart';
import 'package:bowerbird_miniapp/util/constant.dart';
import 'package:bowerbird_miniapp/util/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessageGroupScreen extends ConsumerWidget {
  const MessageGroupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Message Group",
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          TextButton(
            onPressed: () {
              ref.read(loginProvider.notifier).logout();
            },
            child: const Text('LOGOUT'),
          ),
        ],
      ),
      body: Consumer(builder: (context, ref, child) {
        final AsyncValue<List<MessageGroup>> messageGroup =
            ref.watch(messageGroupProvider);
        return Padding(
          padding: const EdgeInsets.all(PaddingConstant.defaultPadding),
          child: switch (messageGroup) {
            AsyncData(:final value) => value.isEmpty
                ? const Center(
                    child: Text('Seems like there is no message group yet!'),
                  )
                : ListView.separated(
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      value.sort((a, b) {
                        DateTime dateTimeA = DateTime.parse(a.updatedAt);
                        DateTime dateTimeB = DateTime.parse(b.updatedAt);
                        return dateTimeB.compareTo(dateTimeA);
                      });
                      MessageGroup messageGroup = value[index];
                      AsyncValue<List<Message>> messages = ref.watch(
                        messageProvider(messageGroup.id),
                      );

                      String? lastMessage =
                          messages.valueOrNull?.isNotEmpty == true
                              ? messages.valueOrNull?.first.message
                              : null;
                      return ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              messageGroup.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              Util.getTimeDifference(messageGroup.updatedAt),
                              style: Theme.of(context).textTheme.bodyMedium,
                            )
                          ],
                        ),
                        subtitle: Text(
                          lastMessage ?? "No message",
                          style: lastMessage != null
                              ? Theme.of(context).textTheme.bodyMedium
                              : Theme.of(context).textTheme.bodySmall,
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => MessageScreen(
                                messageGroupId: messageGroup.id,
                              ),
                            ),
                          );
                        },
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(
                      indent: PaddingConstant.defaultPadding,
                      endIndent: PaddingConstant.defaultPadding,
                    ),
                  ),
            AsyncError() => const Center(
                child: Text('Oops, something unexpected happened'),
              ),
            _ => const LinearProgressIndicator(),
          },
        );
      }),
    );
  }
}

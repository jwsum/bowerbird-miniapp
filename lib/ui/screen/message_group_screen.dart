import 'package:bowerbird_miniapp/model/message_group.dart';
import 'package:bowerbird_miniapp/provider/auth_provider.dart';
import 'package:bowerbird_miniapp/provider/message_group_provider.dart';
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
        title: const Text("Message Group"),
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
                      return ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(messageGroup.name),
                            Text(Util.getTimeDifference(messageGroup.updatedAt))
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(),
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

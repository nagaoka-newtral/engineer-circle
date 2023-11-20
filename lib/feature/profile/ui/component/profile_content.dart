import 'package:engineer_circle/feature/profile/state/component_state/career_option.dart';
import 'package:engineer_circle/feature/profile/state/component_state/profile.dart';
import 'package:engineer_circle/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({
    Key? key,
    required this.profile,
    required this.onTwitterPressed,
    required this.onMusubitePressed,
  }) : super(key: key);

  final Profile profile;
  final Function(String url) onTwitterPressed;
  final Function(String url) onMusubitePressed;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            profile.avatarUrl != null
                ? CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(profile.avatarUrl!),
                  )
                : const Icon(Icons.account_circle, size: 100),
            const SizedBox(height: 8),
            Text(
              profile.name != null ? profile.name! : "",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Image.asset(
                    Assets.images.xLogo.path,
                    width: 24,
                    height: 24,
                    color: profile.twitterLink != null ? null : Colors.grey,
                  ),
                  onPressed: profile.twitterLink != null
                      ? () => onTwitterPressed(profile.twitterLink!)
                      : null,
                ),
                const SizedBox(width: 16),
                IconButton(
                  icon: Image.asset(
                    Assets.images.musubiteLogo.path,
                    width: 28,
                    height: 28,
                    color: profile.musubiteLink != null ? null : Colors.grey,
                  ),
                  onPressed: profile.musubiteLink != null
                      ? () => onMusubitePressed(profile.musubiteLink!)
                      : null,
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(),
            ListTile(
              title: const Text('スキル'),
              subtitle: Wrap(
                spacing: 8.0,
                children: profile.skills
                    .map(
                      (skill) => Chip(
                        label: Text(skill),
                      ),
                    )
                    .toList(),
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text('キャリア'),
              subtitle: Text(
                profile.career != null ? profile.career!.displayName : "",
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text('自己紹介'),
              subtitle: Text(
                profile.selfIntroduction != null
                    ? profile.selfIntroduction!
                    : "",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

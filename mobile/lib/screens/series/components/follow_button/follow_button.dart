import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:forui/forui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:showtv/models/series.dart';
import 'package:showtv/providers/follow_repository_provider.dart';
import 'package:showtv/providers/series_provider.dart';
import 'package:showtv/shared/show_loading_spinner/show_loading_spinner.dart';

class FollowButton extends HookConsumerWidget {
  const FollowButton({required this.series, super.key});

  final Series series;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _series = ref.watch(singleSeriesProvider(series.id));
    final following = useState(series.following);
    final loading = useState(false);
    final pending = useState(true);
    final repository = ref.watch(followRepositoryProvider);

    _series.whenData((data) {
      following.value = data.following;
      pending.value = false;
    });

    return FButton(
      suffix:
          loading.value || pending.value
              ? ShowLoadingSpinner()
              : FIcon(
                following.value
                    ? FAssets.icons.circleCheck
                    : FAssets.icons.circlePlus,
              ),
      label:
          pending.value
              ? Text('')
              : Text(following.value ? 'Following' : 'Follow'),
      onPress:
          loading.value
              ? null
              : () async {
                try {
                  loading.value = true;
                  final token = await FlutterSecureStorage().read(
                    key: 'auth-token',
                  );
                  following.value = await repository.follow(token!, series);
                  ref.invalidate(seriesProvider);
                  ref.invalidate(singleSeriesProvider(series.id));
                } catch (e) {
                  print(e);

                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: const Text('Something went wrong.')),
                  );
                } finally {
                  loading.value = false;
                }
              },
    );
  }
}

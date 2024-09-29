import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/components/header_text.dart';
import 'package:ecommerce_app/core/constants/asset_paths.dart';
import 'package:ecommerce_app/core/extensions/context_extension.dart';
import 'package:ecommerce_app/core/extensions/string_case_extension.dart';
import 'package:ecommerce_app/core/utils/lang/generated/locale_keys.g.dart';
import 'package:ecommerce_app/core/utils/theme/cubit/theme_cubit.dart';
import 'package:ecommerce_app/core/components/buttons/primary_expansion_tile.dart';
import 'package:ecommerce_app/features/profile/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc()..add(const ProfileInitialized()),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildTitle(context),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProfileTile(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  HeaderText _buildTitle(BuildContext context) =>
      const HeaderText(translationKey: LocaleKeys.profile_title);

  BlocBuilder _buildProfileTile(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoad) {
          return SizedBox(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: context.colors.onPrimary,
                backgroundImage: const AssetImage(AssetPaths.profileImage),
                radius: 30,
              ),
              title: Text(
                '${state.profileModel!.name!.firstname.toString().toTitleCase()} ${state.profileModel!.name!.lastname.toString().toTitleCase()}', // LocaleKeys.common_placeholder_name.tr().toTitleCase(),
                style: context.textTheme.headlineSmall!
                    .copyWith(color: context.colors.onSurface),
              ),
              subtitle: Text(
                state.profileModel!.email!,
                style: context.textTheme.bodySmall!
                    .copyWith(color: context.colors.onSurface),
              ),
            ),
          );
        }
        if (state is ProfileError) {
          return const Text('ERROR');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}